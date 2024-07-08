WSES Case Questions
data<-read.csv("WSES_data.csv")
str(data)
head(data)
1.	The marketing team of WSES believes that the average sales value of the leads that they receive is at least 8 million dollars. The marketing team believes that the standard deviation of sales value in the population is about 2 million Use an appropriate hypothesis test to check whether the average sales value in the population is at least 8 million dollars.
8    
library(BSDA)
z_test_result <- z.test(sample_data, mu = 8, sigma.x = 2)

z.test(data$Sales.Value.in.Million,mu=8,sigma.x = 2)


2.	Jason McCullagh, senior marketing manager at WSES, doubted the value of standard deviation provided by the marketing team. Jason argued that there was no way the marketing team could have known the population standard deviation for the sales value, since the population itself is unknown. Do you agree with Jason McCullagh? If yes, perform the test again using an appropriate hypothesis test.

t.test(data$Sales.Value.in.Million,mu=8)

3.	Prudy Perkins, the Chief Marketing Office (CMO) informed the board that they win at least 50% of the sales leads they receive. Use an appropriate hypothesis testing procedure to check whether the proportion of leads won by WSES is more than 50%.

prop.test(x=sum(data$Sales.Outcome==1),n=nrow(data),p=0.5)

4.	Hendry Jackson, who works in the product line 'Learnsys', claims that the probability of winning a sales lead for the product 'Learnsys' is more than that of FinSys'. Is there statistically significant evidence in favour of Hendry's claim?
data$Product=factor(data$Product)
table(data$Sales.Outcome,data$Product)
prop.test(x=c(71,34),n=c(71+55,34+83))


  

5.	John Crocker also claims that the average sales value of "Learnsys' projects is higher than that of FinSys' projects. Check whether John Crocker is correct at 5% significance. 
a<-data$Sales.Value.in.Million[data$Product=='LearnSys']
b<-data$Sales.Value.in.Million[data$Product=='Finsys']
table(data$Product)
shapiro.test(a)
shapiro.test(b)
?t.test

var.test(a,b)

t.test(a,b,alternative='greater',mu=0,var.equal = TRUE)




6.	Liz was of the opinion that there was no difference in the average profit and geographical locations: United Kingdom, India and the Americas. Use an appropriate test to verify the same.

?annova.test()