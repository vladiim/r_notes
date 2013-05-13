http://www.r-bloggers.com/the-guerilla-guide-to-r/

The Guerilla Guide to R
=======================

May 12, 2013

By [Nikhil
Gopal](http://www.r-bloggers.com/author/nikhil-gopal/ "Posts by Nikhil Gopal")

[](https://twitter.com/share)

(This article was first published on
**[Optinalysis](http://www.nikhilgopal.com/2013/05/the-guerilla-guide-to-r.html)**,
and kindly contributed to [R-bloggers)](http://www.r-bloggers.com/)

**Update:** I am aware the table of contents are being displayed in
bullet form as I intended. The web template I'm using seems to be buggy.
It also seems to think this page is in Indonesian...Working on it!****\
 \
 **Table of Contents:**\

**Reading/Writing Files**

1.  [How to write lines of text into a
    file](http://stackoverflow.com/questions/2470248/write-lines-of-text-to-a-file-in-r)
2.  [Trimming a huge (3.5GB) csv file to read into
    R](http://stackoverflow.com/questions/3094866/trimming-a-huge-3-5-gb-csv-file-to-read-into-r)
3.  [Quickly reading large dataframes into
    R](http://stackoverflow.com/questions/1727772/quickly-reading-very-large-tables-as-dataframes-in-r)
4.  [How can I tell if my R dataset is going to be too
    large?](http://stackoverflow.com/questions/12767432/how-can-i-tell-when-my-dataset-in-r-is-going-to-be-too-large)
5.  [Standard logging library for
    R](http://stackoverflow.com/questions/1928332/is-there-any-standard-logging-package-for-r)

**Dataframes**

1.  [How do you write a CSV in R with matrix names dimnames(M)
    intact?](http://stackoverflow.com/questions/1413697/how-do-you-write-a-csv-in-r-with-the-matrix-names-dimnamesm-intact-in-r?rq=1)
2.  [How to join dataframes in R (inner, outer, left,
    right)?](http://stackoverflow.com/questions/1299871/how-to-join-data-frames-in-r-inner-outer-left-right)
3.  [Dropping Columns in
    Dataframes](http://stackoverflow.com/questions/4605206/drop-columns-r-data-frame)
4.  [Dropping factor levels in a subsetted
    dataframe](http://stackoverflow.com/questions/1195826/dropping-factor-levels-in-a-subsetted-data-frame-in-r)
5.  [Remove rows with NA in your
    dataframe](http://stackoverflow.com/questions/4862178/remove-rows-with-nas-in-data-frame)
6.  [Creating an R dataframe row by
    row](http://stackoverflow.com/questions/3642535/creating-an-r-dataframe-row-by-row)
7.  [Fastest way to merge/join
    dataframes](http://stackoverflow.com/questions/4322219/whats-the-fastest-way-to-merge-join-data-frames-in-r)

**Lists and Vectors**

1.  [How to correctly use lists in
    R?](http://stackoverflow.com/questions/2050790/how-to-correctly-use-lists-in-r)
2.  [Levels - what sorcery is
    this?](http://stackoverflow.com/questions/10449366/levels-what-sorcery-is-this/10491881#10491881)
3.  [R function for testing if a vector contains a given
    element?](http://stackoverflow.com/questions/1169248/r-function-for-testing-if-a-vector-contains-a-given-element)
4.  [Converting lists to
    dataframe](http://stackoverflow.com/questions/4227223/r-list-to-data-frame)
5.  [In R, what is the difference between [] and [[]] notations
    accessing the elements of a
    list](http://stackoverflow.com/questions/1169456/in-r-what-is-the-difference-between-the-and-notations-for-accessing-the)
6.  [How to convert a factor to an integer/numeric without a loss of
    information](http://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-an-integer-numeric-without-a-loss-of-information)
7.  [How to access the last value of a
    vector](http://stackoverflow.com/questions/77434/how-to-access-the-last-value-in-a-vector)
8.  [Removing an element from a
    list](http://stackoverflow.com/questions/652136/how-can-i-remove-an-element-from-a-list)
9.  [Extracting the last n characters from a
    string](http://stackoverflow.com/questions/7963898/extracting-the-last-n-characters-from-a-string-in-r)

**Exceptions and Gotchas**

1.  [What is the biggest R gotcha you've run
    across?](http://stackoverflow.com/questions/1535021/whats-the-biggest-r-gotcha-youve-run-across)
2.  [Exception handling in
    R](http://stackoverflow.com/questions/2622777/exception-handling-in-r)
3.  [Reading commandline parameters from an R
    script](http://stackoverflow.com/questions/2151212/how-can-i-read-command-line-parameters-from-an-r-script)
4.  [Assignment operators in R: '=' vs '<-
    a=""\>](http://stackoverflow.com/questions/1741820/assignment-operators-in-r-and)
5.  [Why is not (explicitly) calling return faster or better, and thus
    preferable?](http://stackoverflow.com/questions/11738823/explicitly-calling-return-in-a-function-or-not)
6.  [Why does TRUE == "TRUE" in
    R?](http://stackoverflow.com/questions/14932015/why-does-true-true-in-r)
7.  [What is the difference between '1L' and
    '1'?](http://stackoverflow.com/questions/7014387/whats-the-difference-between-1l-and-1)
8.  [Why does the number 1e99999 (31 9's) cause
    problems?](http://stackoverflow.com/questions/11700748/why-does-the-number-1e9999-31-9s-cause-problems-in-r)
9.  [Examples of the perils of globals in R and
    Stata](http://stackoverflow.com/questions/5526322/examples-of-the-perils-of-globals-in-r-and-stata)
10. [How to count TRUE values in a logical
    vector](http://stackoverflow.com/questions/2190756/in-r-how-to-count-true-values-in-a-logical-vector)

**Sorting**

1.  [Letter "y" comes after "i" when
    sorting?](http://stackoverflow.com/questions/14458314/letter-y-comes-after-i-when-sorting-alphabetically)
2.  [How to sort a dataframe by column(s) in
    R?](http://stackoverflow.com/questions/1296646/how-to-sort-a-dataframe-by-columns-in-r/1296745#1296745)
3.  [Fastest way to find the second (or third) highest/lowest value in a
    vector or
    column](http://stackoverflow.com/questions/2453326/fastest-way-to-find-second-third-highest-lowest-value-in-vector-or-column)

**Plotting**

1.  [Plotting 2 graphs in the same
    plot](http://stackoverflow.com/questions/2564258/plot-2-graphs-in-same-plot-in-r)
2.  [How to plot 2 histograms together in
    R](http://stackoverflow.com/questions/3541713/how-to-plot-two-histograms-together-in-r)
3.  [Histogram with a logarithmic
    scale](http://stackoverflow.com/questions/1245273/histogram-with-logarithmic-scale)
4.  [The most underutilized
    visualization](http://stackoverflow.com/questions/2076370/most-underused-data-visualization)
5.  [Rotating and spacing axis labels in
    ggplot2](http://stackoverflow.com/questions/1330989/rotating-and-spacing-axis-labels-in-ggplot2)
6.  [Shading a kernal density plot between 2
    points](http://stackoverflow.com/questions/3494593/shading-a-kernel-density-plot-between-two-points)
7.  [Choosing between qplot() and ggplot() in
    ggplot2](http://stackoverflow.com/questions/5322836/choosing-between-qplot-and-ggplot-in-ggplot2)
8.  [Intelligent point label placement in
    R](http://stackoverflow.com/questions/7611169/intelligent-point-label-placement-in-r)
9.  [Plotting a correlation
    matrix](http://stackoverflow.com/questions/5453336/plot-correlation-matrix-into-a-graph)
10. [Plotting a 3D surface plot with contour map overlay, using
    R](http://stackoverflow.com/questions/1896419/plotting-a-3d-surface-plot-with-contour-map-overlay-using-r)
11. [Side-by-side plots using
    ggplot2](http://stackoverflow.com/questions/1249548/side-by-side-plots-with-ggplot2-in-r)
12. [Ggplot2 cheat
    sheet](http://stackoverflow.com/questions/3446495/ggplot2-cheat-sheet)
13. [Plot a human body in
    2D](http://stackoverflow.com/questions/10670751/r-plot-human-body-in-2d)
14. [Plotting 2 variables as lines using
    ggplot2](http://stackoverflow.com/questions/3777174/plotting-two-variables-as-lines-using-ggplot2)
15. [Getting rid of axis values in an R
    plot](http://stackoverflow.com/questions/1154242/getting-rid-of-axis-values-in-r-plot)

**Grouping Functions and Speed**

1.  [R grouping functions: sapply vs lapply vs apply vs tapply vs
    etc.](http://stackoverflow.com/questions/3505701/r-grouping-functions-sapply-vs-lapply-vs-apply-vs-tapply-vs-by-vs-aggrega)
2.  [Why is '[' better than the subset
    function?](http://stackoverflow.com/questions/9860090/in-r-why-is-better-than-subset)
3.  [Confused by
    ...()](http://stackoverflow.com/questions/12523548/confused-by)
4.  [Speeding up "group by"
    functions](http://stackoverflow.com/questions/3685492/r-speeding-up-group-by-operations)
5.  [Options for caching/memoization/hashing in
    R](http://stackoverflow.com/questions/7262485/options-for-caching-memoization-hashing-in-r)

**Random**

1.  [Making XKCD style plots in
    R](http://stackoverflow.com/questions/12675147/how-can-we-make-xkcd-style-graphs-in-r)
2.  [Developing geographic thematic maps with
    R](http://stackoverflow.com/questions/1260965/developing-geographic-thematic-maps-with-r)
3.  [What can Matlab do that R cannot
    do?](http://stackoverflow.com/questions/1738087/what-can-matlab-do-that-r-cannot-do)
4.  [Where to learn C code to speed up your R
    functions](http://stackoverflow.com/questions/4106174/where-can-i-learn-to-how-to-write-c-code-to-speed-up-slow-r-functions)
5.  [How to organize large R
    programs](http://stackoverflow.com/questions/1266279/how-to-organize-large-r-programs)
6.  [The difference between library() and
    require()](http://stackoverflow.com/questions/5595512/what-is-the-difference-between-require-and-library)
7.  [Unloading a package without restarting
    R](http://stackoverflow.com/questions/6979917/how-to-unload-a-package-without-restarting-r)
8.  [What is the difference between R.exe, Rterm.exe, Rscript.exe, and
    Rcmd.exe?](http://stackoverflow.com/questions/3412911/r-exe-rcmd-exe-rscript-exe-and-rterm-exe-whats-the-difference)
9.  [What is your preferred style for naming variables in
    R?](http://stackoverflow.com/questions/1944910/what-is-your-preferred-style-for-naming-variables-in-r)
10. [In R, what exactly is the problem with having objects with the same
    base name as
    functions?](http://stackoverflow.com/questions/6135868/in-r-what-exactly-is-the-problem-with-having-variables-with-the-same-name-as-ba)
11. [Easter eggs in
    R](http://stackoverflow.com/questions/7910270/are-there-any-easter-eggs-in-base-r-or-in-major-packages)
12. [Drawing an excellent
    cow](http://stackoverflow.com/questions/15705301/drawing-an-excellent-cow)
13. [Display a time clock on the R
    commandline](http://stackoverflow.com/questions/4222476/r-display-a-time-clock-in-the-r-command-line)
14. [What are
    slots?](http://stackoverflow.com/questions/4713968/r-what-are-slots)

**Case Studies**

1.  [How to determine the position of the sun at a given time of day,
    latitude and
    longitude](http://stackoverflow.com/questions/8708048/position-of-the-sun-given-time-of-day-latitude-and-longitude)
2.  [Implementing Model-View-Control (MVC) in
    R](http://stackoverflow.com/questions/9674027/implementing-standard-software-design-patterns-focus-on-mvc-in-r)
3.  [Scraping html tables into R
    dataframes](http://stackoverflow.com/questions/1395528/scraping-html-tables-into-r-data-frames-using-the-xml-package)
4.  [R + ggplot: time series with
    events](http://stackoverflow.com/questions/8317584/r-ggplot-time-series-with-events)
5.  [Speed up loop operation in
    R](http://stackoverflow.com/questions/2908822/speed-up-the-loop-operation-in-r)
6.  [How to scrape the web for the list of R release
    dates](http://stackoverflow.com/questions/13567453/how-to-scrape-the-web-for-the-list-of-r-release-dates)
