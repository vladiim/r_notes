# [Tracking down errors in R](http://www.r-bloggers.com/tracking-down-errors-in-r)

It's that moment we all know and love, somewhere in our code something has gone wrong. We think we have done everything right, but instead of expected glory we find only terse red text lain below our lintel. 

This can be very frustrating, and trouble shooting these issues can often be very time consuming. 

All is not lost. There are a few bits of R that can greatly help finding out what exactly has gone wrong and where, which in turn should suggest a reasonable course of action.

First we will look at some simple methods we can use to track down issues, namely the warn option and traceback, and then we will look at stepping through functions with debug. 

First Steps

I'm going to use an example that has stuck with me from when I first started using R, using neural nets for classification with the iris data.

Let's take a look at the error:

library(nnet)
X <- iris[,1:4]
Y <- iris[,5]
mod <- nnet(X, Y, size=2)

# weights: 19
Error in nnet.default(X, Y, size = 2) : 
  NA/NaN/Inf in foreign function call (arg 2)
In addition: Warning message:
In nnet.default(X, Y, size = 2) : NAs introduced by coercion

Urgh. Really? What the hell does that mean?

We can use the built in traceback() function to see where this error occured

> traceback()
2: nnet.default(X, Y, size = 2)
1: nnet(X, Y, size = 2)
> 

We can see our call to nnet(), which in turn has called nnet.default() and which is where our error has come from. 

In the error output, we can see there was also a warning "NAs introduced by coercion". As we weren't expecting any warnings, let's track down that, as errors tend to compound. 

Warnings

To find out where that message was coming from, we will use options(warn = 2) which will turn warning messages into errors. We can do this by setting the warn option to a specific level, in this case 2. 

The default is warn = 0, which means warnings will be stored until the top level function returns. We could use warn = 1 which wil print the warning as it is encountered, but in this case we want to stop straight away, so will set it to 2.

options(warn = 2)

Let's try again:

> mod <- nnet(X, Y, size=2)
# weights: 19
Error in nnet.default(X, Y, size = 2) : 
  (converted from warning) NAs introduced by coercion
>

Hmm, still coming from nnet.default, let's see if traceback() is offering any new information.

> traceback()
6: doWithOneRestart(return(expr), restart)
5: withOneRestart(expr, restarts[[1L]])
4: withRestarts({
       .Internal(.signalCondition(simpleWarning(msg, call), msg, 
           call))
       .Internal(.dfltWarn(msg, call))
   }, muffleWarning = function() NULL)
3: .signalSimpleWarning("NAs introduced by coercion", quote(nnet.default(X, 
       Y, size = 2)))
2: nnet.default(X, Y, size = 2)
1: nnet(X, Y, size = 2)
> 

We see a whole bunch of extra stuff in the traceback(), but from 3 onwards it appears to be sideffects of having set warn = 2. We do however see our warning has come from nnet.default again, so we will dig into that to see if we can find out what is going on.

Getting dirty with debug()

To do this, we can use the debug function. We will turn on debugging for nnet, which will let us step through the code line by line as it is executed.

> debug(nnet)
> mod <- nnet(X, Y, size=2)
debugging in: nnet(X, Y, size = 2)
debug: UseMethod("nnet")
Browse[2]> 

The Browse> prompt tells us we are in the debugger. The debug: UseMethod("nnet") tells us the next line of code to be executed is UseMethod("nnet"). We could enter 'n' here to continue to the next line, however a convenient default is just hitting enter (i.e. an empty line). 

Browse[2]> 
debugging in: nnet.default(X, Y, size = 2)
debug: {
    net <- NULL
...
    class(net) <- "nnet"
    net
}
Browse[3]> 

Here R has printed out the R source for the function we just entered. We can see we are still at our Browse> prompt, so will continue on by hitting enter again and again:

Browse[3]> 
debug: net <- NULL
Browse[3]> 
debug: x <- as.matrix(x)
Browse[3]> 
debug: y <- as.matrix(y)
Browse[3]> 
debug: if (any(is.na(x))) stop("missing values in 'x'")
Browse[3]> 
debug: NULL
Browse[3]> 

Well this is neat. Hitting enter at the prompt, R shows us each line that is about to be executed. We will continue on hitting enter until we see our error message.

Browse[3]> 
… 
Browse[3]>
debug: if (length(weights) != ntr || any(weights < 0)) stop("invalid weights vector")
Browse[3]> 
debug: NULL
Browse[3]>

One thing of interest, we can see a conditional if statement is about to be run. When the conditional is evaluated as false, meaning the conditioning code won't be executed, we will see the debug: NULL printed out. 

Browse[3]> 
debug: Z <- as.double(cbind(x, y))
Browse[3]> 
Error in nnet.default(X, Y, size = 2) : 
  (converted from warning) NAs introduced by coercion
> 

Well, there is our warning message. Unfortunately we have lost the Browse> prompt, meaning we are no longer inside the function being debugged, but back at the main prompt. 

This is a side effect of our rather aggressive options("warn") setting. Let's tone it down a bit and set it to 1 so the warnings will be printed as they occur, then jump back into debugging.

> options(warn=1)
> mod <- nnet(X, Y, size=2)
debugging in: nnet(X, Y, size = 2)
debug: UseMethod("nnet")
Browse[2]> 
debugging in: nnet.default(X, Y, size = 2)
debug: {
    net <- NULL
…
Browse[3]> 
…
Browse[3]> 
debug: Z <- as.double(cbind(x, y))
Browse[3]> 
Warning in nnet.default(X, Y, size = 2) : NAs introduced by coercion
debug: storage.mode(weights) <- "double"
Browse[3]> 

After some time, we get our warning message, and we are still in our debugged function. The warning is coming from the line

Z <- as.double(cbind(x, y))

What could be the problem here? Something is going wrong when nnet is converting x and y to doubles. Let's take a look at them to see if there is anything going on.

We can do this by using get("variable"), where variable is the quoted name of the variable. First let's take a look at other two variables in the function to see how it works:

Browse[3]> get("nout")
[1] 1
Browse[3]> get("ntr")
[1] 150
Browse[3]> 

Looking back at the debug output of each line, we can see they were set as some of the dimension info for X and Y, nout has a value of 1 and ntr has a value of 150. 

Let's take a look at x and y now:

Browse[3]> get("x")
       Sepal.Length Sepal.Width Petal.Length Petal.Width
  [1,] 5.1 3.5 1.4 0.2
  [2,] 4.9 3.0 1.4 0.2
  [3,] 4.7 3.2 1.3 0.2
  [4,] 4.6 3.1 1.5 0.2
…
Browse[3]>

This is our input X data.

Browse[3]> get("y")
       [,1]        
  [1,] "setosa"    
  [2,] "setosa"    
  [3,] "setosa"    
  [4,] "setosa"    
...
Browse[3]>

And here is our Y data, just as we passed in.

Recall the warning was triggered by this line:

Z <- as.double(cbind(x, y))

Which is converting x and y to the numeric double type. 

We can see that x is numeric data, while y is character data. What happens if you convert character data to numeric? It doesn't seem to make sense, but let's try:

Browse[3]> as.numeric(get("y"))
Warning: NAs introduced by coercion
  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [37] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [73] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[109] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[145] NA NA NA NA NA NA
Browse[3]> 

A-ha!

This is just the warning we see, and thinking about it, we can understand why converting strings to numeric data is probably not going to be particularly meaningful.

Let's get out of the debugger and think about what might be going on. Hit 'c' to continue execution 

Browse[3]> c
Error in nnet.default(X, Y, size = 2) : 
  NA/NaN/Inf in foreign function call (arg 2)
>

We are now back at the main prompt. 

Now what??

What is going on? It seems reasonable that we should be able to pass a factor for classification, in fact we are pretty sure that's what we saw being used in the examples in the nnet package documentation.

A careful reading of help(nnet) reveals some details. In particular:

If the response in formula is a factor, an appropriate classification network is constructed ... If the response is not a factor, it is passed on unchanged to nnet.default.

It is possible to pass a factor in Y, but we must use the formula syntax. Looking at the examples, we see the matrix syntax in use as well, however it is transforming the y values using class.ind(). 

Right about now I contemplate calling the police, as I'm pretty sure someone has snuck in and changed the docs while I wasn't looking. There is no way I would make such a simple mistake ...  

Anyway, let's turn off debugging, and see if we can get this working:

> undebug(nnet)
> mod <- nnet(X, class.ind(Y), size=2)
> mod <- nnet(Y~., data=cbind(X, Y), size=2)

Both methods run without error (or warning). Success at last.

Outro

We've seen a few ways we can dig into R and track down where things are going wrong. First is using options(warn=2) to make the R convert warnings to errors, and using traceback() to find out in which function the issue is arising. 

Often, this may be enough to get things back on track, especially if the function causing trouble is small. For more complex issues, we can use debug() which will let us step through the function line by line, inspecting variables and internal state as needed.

It should be said this will only be of use when the source is available to R, i.e. the function in question has been implemented in R and not compiled C/C++/Fortran or whatever that is imported as a shared lib. Deubgging that is more involved and there is some reasonable documentation on this available here.

That's all for now, happy hunting and thanks for stopping by.