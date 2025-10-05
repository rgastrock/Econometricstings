# Question 6----
#read in data to R
data <- read.csv('ceosal2.csv', stringsAsFactors =  F)

#salary ~ sales + mktval
mod1 <- lm(salary ~ sales + mktval, data = data)
print(summary(mod1))

#constant elasticity variety
mod2 <- lm(lsalary ~ lsales + lmktval, data = data)
print(summary(mod2))

#add profits
hist(data$profits)
log(data$profits) #PRODUCES NaNs
mod3 <- lm(lsalary ~ lsales + lmktval + profits, data = data)
print(summary(mod3)) #no, profits as predictor adds no added variance explained to model

#ceoten
mod4 <- lm(lsalary ~ lsales + lmktval + profits + ceoten, data = data)
print(summary(mod4))

# Question 7----
#read in data to R
data2 <- read.csv('tbrate.csv', check.names=F)
colnames(data2) <- c("", "Year", "Quarter", "interest rate", "rate of inflation", "log GDP")
ndat <- data2[3:188,]

#interest rate first diff operator
delta_r <- diff(ndat$`interest rate`)

#rate of inflation t-1
pi_t0 <- ndat$`rate of inflation`[1:185]

#delta inflationv (t-1)
ndat2 <- data2[2:188,]
delta_infl <- diff(ndat2$`rate of inflation`)
delta_infl <- delta_infl[2:186]

