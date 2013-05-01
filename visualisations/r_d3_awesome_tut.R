http://timelyportfolio.github.io/rCharts_512paths/

We will provide a detailed tutorial below to go from the NYT feature to something we can render from R, but for now you can just download the rCharts_512paths directory from Github. Set your working directory (setwd) to your download location. Then simply run the following couple lines of code in R.
# if you have not installed slidify, slidifyLibraries, or rCharts
# require(devtools) install_github('slidify', 'ramnathv', ref = 'dev')
# install_github('rCharts', 'ramnathv') install_github('slidifyLibraries',
# 'ramnathv', ref = 'dev') # optional
# setwd('rCharts_512paths')
require(rCharts)
# get data from downloaded NYT tsv and inject in through params
data <- read.delim(file = "data/states.tsv")
p1 <- rCharts$new()
p1$field("lib", "libraries/widgets/x512paths")
p1$set(data = toJSONArray(data))
p1

Steps to Accomplish
Create a new directory x512paths anywhere you like. We choose x512paths, since shiny does not like paths that start with a number. Within this new x512paths, set up two subdirectories: external and layouts.
Save iframe.html from the NYT into the new x512paths/layouts directory from step 1. This isolates the visualization, so we can use it for our template.
Rename iframe.html to chart.html.
Open chart.html from step 2 in a text editor.
Copy everything between the tags into a new text file that we will name nyt_512.css and save in x512paths/external created in step 1.
Delete everything in chart.html except for the portion
   
  div class="g-controls"    
  ...    
    function diagonal(d) {    
    var x0 = d.source.x, y0 = y(d.source.depth),    
        x1 = d.target.x, y1 = y(d.target.depth);    
    if (x0 < x1) x0 += w(d.target.probability) / 2;    
    else if (x0 > x1) x0 -= w(d.target.probability) / 2;    
    return "M" + x0 + "," + y0    
        + "C" + x0 + "," + (y0 + y1) / 2    
        + "," + x1 + "," + (y0 + y1) / 2    
        + "," + x1 + "," + y1;    
    }    
 
  })();    
  \<\/script\>
Change the line
d3.tsv("states.tsv", function(error, states) {    
to
d3.tsv("http://timelyportfolio.github.io/rCharts_512paths/data/states.tsv", function(error, states) {    
Save d3.v3.min.js into x512paths/external created in step 1.
Create a new text file that we will call config.yml and save in the x512paths from step 1.
  
x512paths:    
    css: [external/nyt_512.css]    
    jshead: [external/d3.v3.min.js]    
    cdn:    
      jshead:    
        - http://d3js.org/d3.v3.min.js
Now is a good time to check your directory structure. It should look like the picture below.

Try to rerun the code above in R, but change the
p1$field("lib", "libraries/widgets/x512paths")
to
p1$field("lib", "pathtoyournewdirectory/x512paths")
so your couple of lines of code should look something like this.
require(rCharts)
# get data from downloaded NYT tsv and inject in through params
data <- read.delim(file = "data/states.tsv")
p1 <- rCharts$new()
# make sure to change this path to your newly created masterpiece
p1$field("lib", "pathtoyournewdirectory/x512paths")
p1$set(data = toJSONArray(data))
p1
As a disclaimer, I made some unnecessary adjustments not documented above. These were primarily for politeness. The only changes to the code remove dependencies on NYT for the d3 and svg/png graphics. Also, as an illustration of how we can do this, data is provided from R rather than the original d3.tsv method. If you are interested in these changes, feel free to explore the code.

Thanks to:
Ramnath Vaidyanathan for his incredible slidify, rCharts, and more specifically help with this post
Mike Bostock for d3, countless examples, and published NY Times greatness