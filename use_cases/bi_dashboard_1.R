Creating a Business Dashboard in R
March 28, 2013
By Bart

(This article was first published on FishyOperations » R, and kindly contributed to R-bloggers)
Business dashboards are available in many shapes and sizes. Business dashboards are useful to create an overview of key performance indicators (KPIs) important for the business strategy and/or operations.

There are many flavours of dashboard frameworks and apps available, ranging in price from thousands of dollars to open-source implementations.

Apparently there are four key elements to a good dashboard:

Simple, communicates easily
Minimum distractions…it could cause confusion
Supports organized business with meaning and useful data
Applies human visual perception to visual presentation of information

As the title already indicates, this post is about using R to create simple, cheap and practical business dashboards. Basically we will generate a simple HTML which visualizes the selected KPIs. Let's see if we can achieve this while adhering to the four elements above.

What do you need?

Some knowledge about R
A computer with R installed
The R packages knitr, markdown and ggplot2
A location to output your dashboard (HTML file) to which is accessable by those who need to access it
Steps to take
1. Define the KPIs you want to monitor

There is a lot of information on this topic available on the web.

In this case we will use the dashboard to show the following KPIs:

yearly sales
yearly profits
2. Capture the data

A vital step is defining where the data, which feeds the KPIs, comes from. Is this an operational database or a data warehouse? Is this a Excel / CSV file which regularly gets updated? Is this information available in XML somewhere? Anyhow, the possibilities are endless.

R has a lot of methods of reading/importing this data. For accessing a database RODBC it the way to go, for reading Excel files use xlsx for CSV files R has build in support.

Let's say for example we have an Excel file that is updated on a yearly basis and which we will use for our dashboard.

library(xlsx)
dataset <- read.xlsx("dataset.xlsx", 1)

dataset
##    Year Sales Profits Costs
## 1  2000   500   88.00 412.0
## 2  2001   450   74.88 375.1
## 3  2002   490   85.46 404.5
## 4  2003   425   76.84 348.2
## 5  2004   480   89.86 390.1
## 6  2005   480   82.18 397.8
## 7  2006   405   71.93 333.1
## 8  2007   430   66.74 363.3
## 9  2008   485   83.03 402.0
## 10 2009   475   88.16 386.8
## 11 2010   425   55.76 369.2
## 12 2011   430   69.49 360.5
## 13 2012   430   82.56 347.4
We stored the Excel data in a variable dataset. We will use this dataframe to visualize the KPIs.

3. Visualize the data

Let's visualize the KPI yearly sales:

library(ggplot2)
plot_sales<-ggplot(dataset,aes(x=factor(Year),y=Sales,fill=Sales))+ xlab('Year') + ylab('Sales ($)') +
    geom_bar(stat='identity',colour='black') +      # make a barchart of the data
    scale_fill_gradient(low='red',high='green') +   # add a visual indicator
    ggtitle('Yearly sales') +                       # add a title
    theme(axis.text.x = element_text(angle = -35))  # tilt the axis labels


plot_sales


And yearly profits:

library(ggplot2)
plot_profits<-ggplot(dataset,aes(x=factor(Year),y=Profits,fill=Profits))+ xlab('Year') + ylab('Profits ($)') +
    geom_bar(stat='identity',colour='black') +      # make a barchart of the data
    scale_fill_gradient(low='red',high='green') +   # add a visual indicator
    ggtitle('Yearly profits') +                     # add a title
    theme(axis.text.x = element_text(angle = -35))  # tilt the axis labels

plot_profits


4. Build the dashboard

For this step we will need an R file in which the data is processed and visualized and an .Rmd file which acts as a markdown template in which we incorporate the visualized data.

The .Rmd markdown template:


# Our business dashboard

```{r fig.height=4,echo=FALSE,results='asis'}
## this is a so called 'chunk': a piece of R code

cat('Last updated on:',as.character(Sys.time()))
```


```{r fig.height=4, fig.width=12, echo=FALSE}
## this is a so called 'chunk': a piece of R code

grid.arrange(plot_sales,plot_profits,nrow=1)
```

Some additional text to add context to the KPI interpretation.
The .R file:


library(knitr)
library(ggplot2)
library(gridExtra)

## load the data

library(xlsx)
dataset<-read.xlsx('dataset.xlsx',1)

## visualize the data

plot_sales<-ggplot(dataset,aes(x=factor(Year),y=Sales,fill=Sales))+ xlab('Year') + ylab('Sales ($)') +
	geom_bar(stat='identity',colour='black') + 		# make a barchart of the data
	scale_fill_gradient(low='red',high='green') + 	# add a visual indicator
	ggtitle('Yearly sales') +						# add a title
	theme(axis.text.x = element_text(angle = -35))	# tilt the axis labels

plot_profits<-ggplot(dataset,aes(x=factor(Year),y=Profits,fill=Profits))+ xlab('Year') + ylab('Profits ($)') +
	geom_bar(stat='identity',colour='black') + 		# make a barchart of the data
	scale_fill_gradient(low='red',high='green') + 	# add a visual indicator
	ggtitle('Yearly profits') +						# add a title
	theme(axis.text.x = element_text(angle = -35))	# tilt the axis labels
	

knit2html('dashboard.Rmd') # produces the HTML file
Basically the .R file acts as a container for the data import, transformation and visualization methods while the .Rmd brings the visualized data together in a readable format while making abstraction of the underlying R code. Actually, most of these steps can also be done within the .Rmd file, however, I personally find it more organized to keep this seperated. For more information about how a .Rmd file is set up, minimal examples and chunk options check the knitr website.

When we run the .R we get the following dashboard.

5. Automatic updating of the dashboard

This is were a server comes into places. Basically you'll want to schedule the execution of the main .R file via a cronjob or a Windows task. The time between executions is based on how vital the data is and the frequency at which new data becomes available.

Retrospect
Well, did we achieve to adhere to the four key elemets? I'll leave that up to your assessment. I believe however that, in absence of other dashboard frameworks specifically suited for your purpose, this R-style dashboard can be set-up very quickly at no costs at all (excluding developement).

