http://www.r-bloggers.com/reshaping-data/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+RBloggers+%28R+bloggers%29

Preparing and reshaping data is the ever continuing task of a data analyst. Luckily we have many tools for it. The default tool in R would be reshape(), although this is so user friendly that a reshape package has been added too. I try to use reshape() (the function) because I feel it is a good tool, though with a somewhat cryptical manual. The latter may be because it is written in terms of longitudal data, whereas my experience is  conversion of data from easy to enter in Excel to suitable for analysis in R.
To exercise myself a bit more I have taken all examples from the SAS transpose procedure and implemented them in R.
Examples 1 to 3
These examples are so simple, the best tool is the t() function.

score <- read.table(textConnection('
Student StudentID  Section  Test1 Test2 Final
Capalleti 0545 1  94 91 87
Dubose    1252 2  51 65 91
Engles    1167 1  95 97 97
Grant     1230 2  63 75 80
Krupski   2527 2  80 76 71
Lundsford 4860 1  92 40 86
McBane    0674 1  75 78 72'),header=TRUE,
  colClasses=rep(c('character','numeric'),each=3))
# id, only numerical data
# this case - t(score[,-1:-3])
# general
t(score[,sapply(score,class)=='numeric'])

      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
Test1   94   51   95   63   80   92   75
Test2   91   65   97   75   76   40   78
Final   87   91   97   80   71   86   72

#example 2: studentid
score2 <- score
rownames(score2) <- paste('sn',score2$StudentID,sep='')
t(score2[,-1:-3])

      sn0545 sn1252 sn1167 sn1230 sn2527 sn4860 sn0674
Test1     94     51     95     63     80     92     75
Test2     91     65     97     75     76     40     78
Final     87     91     97     80     71     86     72
#example 3 student names

rownames(score2) <- score2$Student
t(score2[,-1:-3])

      Capalleti Dubose Engles Grant Krupski Lundsford McBane
Test1        94     51     95    63      80        92     75
Test2        91     65     97    75      76        40     78
Final        87     91     97    80      71        86     72
Example 4 by groups
The first 'real' example. Some columns are used to transpose on. In addition the data is ragged, not everywhere there is data. Two unexpected problems appeared here. Location contains a space, which I solved by separating this part and adding it later. Date is in a 7 digit format, but not my locale and a non default layout. Since I need to sort in order to get the data ordered like SAS does, I converted it to a proper date variable.
The transpose itself is not so difficult. I chose to extract the variables to transpose via grep(), so I could reuse this part in the times variable. To make tracking between call and result easy, I used lower and upper case in 'length'. Length is transposed, so weight is dropped from the data. 
# example 4 by groups

fishdata1 <- readLines(textConnection(
'Cole Pond   2JUN95 31 .25 32 .3  32 .25 33 .3
Cole Pond   3JUL95 33 .32 34 .41 37 .48 32 .28
Cole Pond   4AUG95 29 .23 30 .25 34 .47 32 .3
Eagle Lake  2JUN95 32 .35 32 .25 33 .30
Eagle Lake  3JUL95 30 .20 36 .45
Eagle Lake  4AUG95 33 .30 33 .28 34 .42'))
fishdata <- read.table(text=c('Date Length1 Weight1 Length2 Weight2 Length3 Weight3 Length4 Weight4',
           substring(fishdata1,11)),
       fill=TRUE,
       header=TRUE)
fishdata$Location <- gsub(' $','',substring(fishdata1,1,10))
Sys.setlocale(category = "LC_TIME", locale = "C")
fishdata$Date <- as.Date(fishdata$Date,'%d%b%y')
lengthfishdata <- reshape(fishdata,
    varying=list(grep('Length',names(fishdata),value=TRUE)),
    direction='long',
    idvar=c('Date','Location'),
    drop=grep('Weight',names(fishdata),value=TRUE),
    v.names='LENGTH',
    timevar='NAME',
    times=tolower(grep('Length',names(fishdata),value=TRUE)),
  )
rownames(lengthfishdata)  <- 1:nrow(lengthfishdata)
lengthfishdata[order(lengthfishdata$Location,
        lengthfishdata$Date,
        lengthfishdata$NAME),]

         Date   Location    NAME LENGTH
1  1995-06-02  Cole Pond length1     31
7  1995-06-02  Cole Pond length2     32
13 1995-06-02  Cole Pond length3     32
19 1995-06-02  Cole Pond length4     33
2  1995-07-03  Cole Pond length1     33
8  1995-07-03  Cole Pond length2     34
14 1995-07-03  Cole Pond length3     37
20 1995-07-03  Cole Pond length4     32
3  1995-08-04  Cole Pond length1     29
9  1995-08-04  Cole Pond length2     30
15 1995-08-04  Cole Pond length3     34
21 1995-08-04  Cole Pond length4     32
4  1995-06-02 Eagle Lake length1     32
10 1995-06-02 Eagle Lake length2     32
16 1995-06-02 Eagle Lake length3     33
22 1995-06-02 Eagle Lake length4     NA
5  1995-07-03 Eagle Lake length1     30
11 1995-07-03 Eagle Lake length2     36
17 1995-07-03 Eagle Lake length3     NA
23 1995-07-03 Eagle Lake length4     NA
6  1995-08-04 Eagle Lake length1     33
12 1995-08-04 Eagle Lake length2     33
18 1995-08-04 Eagle Lake length3     34
24 1995-08-04 Eagle Lake length4     NA
In practice my call would be different, I would keep both height and weight, and stick the number in a more logical variable than NAME. I think SAS can only achieve this by two transpose calls and a subsequent merge, though I may be mistaken.
reshape(fishdata,
    varying=list(grep('Length',names(fishdata),value=TRUE),
        grep('Weight',names(fishdata),value=TRUE)),
    direction='long',
    idvar=c('Date','Location'),
    v.names=c('Length','Weight'),
    timevar='Fish number',
    new.row.names=1:24
)

         Date   Location Fish number Length Weight
1  1995-06-02  Cole Pond           1     31   0.25
2  1995-07-03  Cole Pond           1     33   0.32
3  1995-08-04  Cole Pond           1     29   0.23
4  1995-06-02 Eagle Lake           1     32   0.35
5  1995-07-03 Eagle Lake           1     30   0.20
6  1995-08-04 Eagle Lake           1     33   0.30
7  1995-06-02  Cole Pond           2     32   0.30
8  1995-07-03  Cole Pond           2     34   0.41
9  1995-08-04  Cole Pond           2     30   0.25
10 1995-06-02 Eagle Lake           2     32   0.25
11 1995-07-03 Eagle Lake           2     36   0.45
12 1995-08-04 Eagle Lake           2     33   0.28
13 1995-06-02  Cole Pond           3     32   0.25
14 1995-07-03  Cole Pond           3     37   0.48
15 1995-08-04  Cole Pond           3     34   0.47
16 1995-06-02 Eagle Lake           3     33   0.30
17 1995-07-03 Eagle Lake           3     NA     NA
18 1995-08-04 Eagle Lake           3     34   0.42
19 1995-06-02  Cole Pond           4     33   0.30
20 1995-07-03  Cole Pond           4     32   0.28
21 1995-08-04  Cole Pond           4     32   0.30
22 1995-06-02 Eagle Lake           4     NA     NA
23 1995-07-03 Eagle Lake           4     NA     NA
24 1995-08-04 Eagle Lake           4     NA     NA
Example 5
Example 5 is named: Naming Transposed Variables When the ID Variable Has Duplicate Values. I am not sure what the naming part is, it seems that only the closing call price is needed, which boils down to taking only the last observation in a category. The data here comes in a fixed format array, I have used (first time) read.fwf() and some calls to strip the spaces from the factors.
To get the transpose I borrowed the idea of a last function from SAS, which is basically a function which indicates that the current record in a variable is different from the next record. Which is very important in SAS because it is fundamentally row (record) organized, whereas R is column (variable) organized. Proper R would just processing dependent on Time='closing' but what is used is functionally closer to the SAS call.
stocks <- read.fwf(textConnection(
'Horizon Kites jun11 opening 29
Horizon Kites jun11 noon    27
Horizon Kites jun11 closing 27
Horizon Kites jun12 opening 27
Horizon Kites jun12 noon    28
Horizon Kites jun12 closing 30
SkyHi Kites   jun11 opening 43
SkyHi Kites   jun11 noon    43
SkyHi Kites   jun11 closing 44
SkyHi Kites   jun12 opening 44
SkyHi Kites   jun12 noon    45
SkyHi Kites   jun12 closing 45'
),col.names=c('Company','Date','Time','Price'),
widths=c(14,5,8,3))
levels(stocks$Company) <- gsub('(^ +)|( +$)','',levels(stocks$Company))
levels(stocks$Time) <- gsub('(^ +)|( +$)','',levels(stocks$Time))
# only last observation
islast <- function(x)  c(x[-length(x)]!=x[-1],TRUE)
reshape(stocks[islast(stocks$Date),],direction='wide',
    timevar='Date',idvar=c('Company'),drop='Time',times=Time)

        Company Price.jun11 Price.jun12
3 Horizon Kites          27          30
9   SkyHi Kites          44          45
Example 6 
Transposing for statistical analysis. We have 5 subjects, who did 3 programs and 7 strength assessments. Why subject is not in the original data baffles me. In SAS this is not run through proc transpose, but rather a data step. But that doesn't stop me from using reshape(). The subject variable is added. In the next step SAS rebuilds to get one file with both formats, seems silly in R context, I am just transforming back, now using subject. 

weights <- read.table(textConnection(
'Program s1 s2 s3 s4 s5 s6 s7
CONT  85 85 86 85 87 86 87
CONT  80 79 79 78 78 79 78
CONT  78 77 77 77 76 76 77
CONT  84 84 85 84 83 84 85
CONT  80 81 80 80 79 79 80
RI    79 79 79 80 80 78 80
RI    83 83 85 85 86 87 87
RI    81 83 82 82 83 83 82
RI    81 81 81 82 82 83 81
RI    80 81 82 82 82 84 86
WI    84 85 84 83 83 83 84
WI    74 75 75 76 75 76 76
WI    83 84 82 81 83 83 82
WI    86 87 87 87 87 87 86
WI    82 83 84 85 84 85 86
'),header=TRUE)
weights1 <- reshape(weights,direction='long',timevar='time',idvar='row',
    varying=list(paste('s',1:7,sep='')),v.names='Strength')
weights1$subject <- 1+ ((weights1$row-1) %% 5)
weights1 <- weights1[order(weights1$Program,weights1$subject,weights1$time),]
(Weights1 <- weights1[,c(1,5,2,3)])[1:15,]

    Program subject time Strength
1.1    CONT       1    1       85
1.2    CONT       1    2       85
1.3    CONT       1    3       86
1.4    CONT       1    4       85
1.5    CONT       1    5       87
1.6    CONT       1    6       86
1.7    CONT       1    7       87
2.1    CONT       2    1       80
2.2    CONT       2    2       79
2.3    CONT       2    3       79
2.4    CONT       2    4       78
2.5    CONT       2    5       78
2.6    CONT       2    6       79
2.7    CONT       2    7       78
3.1    CONT       3    1       78
reshape(Weights1,direction='wide',timevar='time',
    idvar=c('Program','subject'))

     Program subject Strength.1 Strength.2 Strength.3 Strength.4 Strength.5
1.1     CONT       1         85         85         86         85         87
2.1     CONT       2         80         79         79         78         78
3.1     CONT       3         78         77         77         77         76
4.1     CONT       4         84         84         85         84         83
5.1     CONT       5         80         81         80         80         79
6.1       RI       1         79         79         79         80         80
7.1       RI       2         83         83         85         85         86
8.1       RI       3         81         83         82         82         83
9.1       RI       4         81         81         81         82         82
10.1      RI       5         80         81         82         82         82
11.1      WI       1         84         85         84         83         83
12.1      WI       2         74         75         75         76         75
13.1      WI       3         83         84         82         81         83
14.1      WI       4         86         87         87         87         87
15.1      WI       5         82         83         84         85         84
     Strength.6 Strength.7
1.1          86         87
2.1          79         78
3.1          76         77
4.1          84         85
5.1          79         80
6.1          78         80
7.1          87         87
8.1          83         82
9.1          83         81
10.1         84         86
11.1         83         84
12.1         76         76
13.1         83         82
14.1         87         86
15.1         85         86
