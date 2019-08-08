A.5 Answers to the Exercises
A.5.1 Exercises: Chapter 1
Exercise 1.1 (Creating Vectors)
1. The three vectors are created using the rep function with the arguments
each and times:
> vec1 <- rep(1:5,3)
> vec1
[1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
Appendix 271
> vec2 <- rep(1:5,each=3)
> vec2
[1] 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5
> vec3 <- rep(1:4,times=(2:5))
> vec3
[1] 1 1 2 2 2 3 3 3 3 4 4 4 4 4
2. The paste function concatenates vectors:
> vec4 <- paste("A",0:10,")",sep="")
> vec4
[1] "A0)" "A1)" "A2)" "A3)" "A4)" "A5)"
[7] "A6)" "A7)" "A8)" "A9)" "A10)"
3. The position of the letter q is rst calculated. Then the vector of letters
and the vector of indices are pasted:
> pos.q <- which(letters=="q")
> vec5 <- paste(letters[1:pos.q],1:pos.q,sep="")
> vec5
[1] "a1" "b2" "c3" "d4" "e5" "f6" "g7" "h8" "i9"
[10] "j10" "k11" "l12" "m13" "n14" "o15" "p16" "q17"
Exercise 1.2 (Working with NA)
1. The vector is created, and the mean and variance are computed:
> set.seed(007)
> vec1 <- runif(100,0,7)
> mean(vec1)
[1] 3.564676
> var(vec1)
[1] 3.94103
2. Missing values are allocated at random:
> vec2 <- vec1
> ind <- sample(1:100,10)
> vec2[ind] <- NA
> indNA <- which(is.na(vec2))
[1] 4 19 33 38 40 49 62 71 90 99
3. It is necessary to use the argument na.rm=TRUE to compute the mean and
variance.
> mean(vec2)
[1] NA
272 R for Statistics
> mean(vec2,na.rm=T)
[1] 3.539239
> var(vec2)
[1] NA
> var(vec2,na.rm=T)
[1] 3.879225
4. We delete the missing values and nd again the mean and variance previously
calculated with the argument na.rm=TRUE:
> vec3 <- vec2[-indNA]
> mean(vec3)
[1] 3.539239
> var(vec3)
[1] 3.879225
5. If the missing values are replaced by the mean of the variable, then the
mean is the same as before but the variance is under-estimated:
> vec4 <- vec2
> vec4[indNA] <- mean(vec3)
> mean(vec4)
[1] 3.539239
> var(vec4)
[1] 3.487384
6. The missing values are replaced by values drawn from a normal distribution
with mean and standard deviation of the variable:
> vec5 <- vec2
> vec5[indNA] <- rnorm(length(indNA),mean(vec3),sd(vec3))
> mean(vec5)
[1] 3.545158
> var(vec5)
[1] 3.665774
7. The missing values are replaced by values drawn from a Uniform distribution
from the minimum to the maximum of the observed values:
> vec6 <- vec2
> vec6[indNA] <- runif(length(indNA),min(vec3),max(vec3))
> mean(vec6)
[1] 3.726103
> var(vec6)
[1] 3.863905
Appendix 273
8. The missing values are replaced by values randomly drawn from the observed
values:
> vec7 <- vec2
> vec7[indNA] <- sample(vec3,10)
> mean(vec7)
[1] 3.477317
> var(vec7)
[1] 3.89452
Exercise 1.3 (Creating, Manipulating and Inverting a Matrix)
1. The matrix mat is created prior to attributing the row and column names:
> mat <- matrix(c(1,0,3,4,5,5,0,4,5,6,3,4,0,1,3,2),ncol=4)
> rownames(mat) <- paste("row",1:4,sep="-")
> colnames(mat) <- paste("column",1:4)
2. The diagonal elements of the matrix mat are obtained as follows:
> vec <- diag(mat)
> vec
[1] 1 5 3 2
3. The matrix containing the rst 2 rows of mat is obtained as follows:
> mat1 <- mat[c(1,2),]
> mat1
column 1 column 2 column 3 column 4
row-1 1 5 5 0
row-2 0 5 6 1
4. The matrix containing the last 2 columns of mat is obtained as follows:
> mat2 <- mat[,(ncol(mat)-1):ncol(mat)]
> mat2
column 3 column 4
row-1 5 0
row-2 6 1
row-3 3 3
row-4 4 2
5. To calculate the determinant and invert the matrix, simply use the functions
det and solve:
> det(mat)
[1] 60
274 R for Statistics
> solve(mat)
row-1 row-2 row-3 row-4
column 1 0.5 -0.5 0.1666667 -5.551115e-17
column 2 -0.6 0.4 -0.4666667 5.000000e-01
column 3 0.7 -0.3 0.4333333 -5.000000e-01
column 4 -1.2 0.8 -0.2666667 5.000000e-01
Exercise 1.4 (Selecting and Sorting in a Data-Frame)
1. The iris data is loaded and a new dataset is created by selecting only the
rows carrying the value "versicolor" for the Species variable:
> data(iris)
> iris2 <- iris[iris[,"Species"]=="versicolor", ]
2. The dataset is sorted according to the rst variable using the order function:
> iris2[order(iris2[,1],decreasing=TRUE),]
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
51 7.0 3.2 4.7 1.4 versicolor
53 6.9 3.1 4.9 1.5 versicolor
77 6.8 2.8 4.8 1.4 versicolor
...
61 5.0 2.0 3.5 1.0 versicolor
94 5.0 2.3 3.3 1.0 versicolor
58 4.9 2.4 3.3 1.0 versicolor
Exercise 1.5 (Using the apply Function)
1. To calculate the benchmark statistics, simply use the summary function:
> library(lattice) # load the package
> data(ethanol)
> summary(ethanol)
NOx C E
Min. :0.370 Min. : 7.500 Min. :0.5350
1st Qu.:0.953 1st Qu.: 8.625 1st Qu.:0.7618
Median :1.754 Median :12.000 Median :0.9320
Mean :1.957 Mean :12.034 Mean :0.9265
3rd Qu.:3.003 3rd Qu.:15.000 3rd Qu.:1.1098
Max. :4.028 Max. :18.000 Max. :1.2320
2. To calculate the quartiles, we can use the apply function:
> apply(X=ethanol,MARGIN=2,FUN=quantile)
NOx C E
0% 0.3700 7.500 0.53500
25% 0.9530 8.625 0.76175
50% 1.7545 12.000 0.93200
75% 3.0030 15.000 1.10975
100% 4.0280 18.000 1.23200
Appendix 275
3. The instruction for the previous question by default yields the quartiles.
Indeed, since we have not specied the argument probs for the quantile function,
the argument used by default is: probs=seq(0,0.25,0.5,0.75,1) (see
the help section for the quantile function). To obtain deciles, we have to specify
probs=seq(0,1,by=0.1) as the argument. The help section for the apply
function indicates the optional arguments via ...: optional arguments
to 'FUN'. It is therefore possible to \pass" probs=seq(0,1,by=0.1) as an
argument to the FUN=quantile function:
> apply(ethanol,2,quantile,probs=seq(0,1,by=0.1))
NOx C E
0% 0.3700 7.5 0.5350
10% 0.6000 7.5 0.6496
20% 0.8030 7.5 0.7206
30% 1.0138 9.0 0.7977
40% 1.4146 9.0 0.8636
50% 1.7545 12.0 0.9320
60% 2.0994 12.6 1.0104
70% 2.7232 15.0 1.0709
80% 3.3326 15.0 1.1404
90% 3.6329 18.0 1.1920
100% 4.0280 18.0 1.2320
Exercise 1.6 (Selection in a Matrix with the apply Function)
1. The matrix containing the columns of mat having all values smaller than
6 is obtained as follows:
> mat <- matrix(c(1,0,3,4,5,5,0,4,5,6,3,4,0,1,3,2),ncol=4)
> mat3 <- mat[,apply((mat<6),2,all)]
> mat3
[,1] [,2] [,3]
[1,] 1 5 0
[2,] 0 5 1
[3,] 3 0 3
[4,] 4 4 2
2. Because there is only one row which do not contain 0, we have to use
drop=FALSE such that the output is a matrix and not a vector:
> mat4 <- mat[apply((mat>0),1,all),,drop=FALSE]
> mat4
[,1] [,2] [,3] [,4]
[1,] 4 4 4 2
Exercise 1.7 (Using the lapply Function)
1. The MASS package and the dataset Aids2 are loaded:
276 R for Statistics
> library(MASS) # load the package
> data(Aids2)
> summary(Aids2)
state sex diag death status
NSW :1780 F: 89 Min. : 8302 Min. : 8469 A:1082
Other: 249 M:2754 1st Qu.:10163 1st Qu.:10672 D:1761
QLD : 226 Median :10665 Median :11235
VIC : 588 Mean :10584 Mean :10990
3rd Qu.:11103 3rd Qu.:11504
Max. :11503 Max. :11504
T.categ age
hs :2465 Min. : 0.00
blood : 94 1st Qu.:30.00
hsid : 72 Median :37.00
other : 70 Mean :37.41
id : 48 3rd Qu.:43.00
haem : 46 Max. :82.00
(Other): 48
2. The function is.numeric returns a boolean: TRUE when the object on which
it is applied is numeric. We have to apply this function to each column of the
data-frame Aids2 and take the negation (operator !). As the data-frame is a
list, applying a function to each column is (usually) equivalent to applying a
function to each component of the list; this is the scope of the lapply function:
> ind <- !unlist(lapply(Aids2,is.numeric))
3. We just have to select the variables of the data-frame using ind:
> Aids2.qual <- Aids2[,ind]
4. We use the levels function on each element of the data-frame Aids2.qual:
> lapply(Aids2.qual,levels)
Exercise 1.8 (Levels of the Qualitative Variables in a Subset)
1. The package MASS and the dataset Aids2 are loaded:
> library(MASS) # load the package
> data(Aids2)
2. The selection is done as follows:
> res <- Aids2[(Aids2[,"sex"]=="M")&(Aids2[,"state"]!="Other"),]
Another method consists in using the subset function.
Appendix 277
3. The summary indicates that the levels are still the same, M and F, but no
individuals take the category F.
> summary(res)
state sex diag death status
NSW :1726 F: 0 Min. : 8302 Min. : 8469 A: 947
Other: 0 M:2518 1st Qu.:10155 1st Qu.:10671 D:1571
QLD : 217 Median :10662 Median :11220
VIC : 575 Mean :10583 Mean :10987
3rd Qu.:11104 3rd Qu.:11504
Max. :11503 Max. :11504
T.categ age
hs :2260 Min. : 0.00
hsid : 68 1st Qu.:30.00
other : 55 Median :37.00
blood : 54 Mean :37.36
haem : 40 3rd Qu.:43.00
id : 21 Max. :82.00
(Other): 20
4. The attributes of sex are:
> attributes(res[,"sex"])
$levels
[1] "F" "M"
$class
[1] "factor"
5. We transform the sex variable into a character object and print the attributes
of the resulting object:
> sexc <- as.character(res[,"sex"])
> attributes(sexc)
NULL
6. Transform the sexc into a factor:
> sexf <- as.factor(sexc)
> attributes(sexf)
$levels
[1] "M"
$class
[1] "factor"
278 R for Statistics
7. We select the indices of the non-numeric variables:
> ind <- !unlist(lapply(res,is.numeric))
> ind
state sex diag death status T.categ age
TRUE TRUE FALSE FALSE TRUE TRUE FALSE
8. We transform the selected variables into character:
> res[,ind] <- lapply(res[,ind],as.character)
9. We transform the selected variables into factors:
> res[,ind] <- lapply(res[,ind],as.factor)
> summary(res)
state sex diag death status
NSW:1726 M:2518 Min. : 8302 Min. : 8469 A: 947
QLD: 217 1st Qu.:10155 1st Qu.:10671 D:1571
VIC: 575 Median :10662 Median :11220
Mean :10583 Mean :10987
3rd Qu.:11104 3rd Qu.:11504
Max. :11503 Max. :11504
T.categ age
hs :2260 Min. : 0.00
hsid : 68 1st Qu.:30.00
other : 55 Median :37.00
blood : 54 Mean :37.36
haem : 40 3rd Qu.:43.00
id : 21 Max. :82.00
(Other): 20
