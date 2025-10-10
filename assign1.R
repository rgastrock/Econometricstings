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
r <- data2$`interest rate`
pi <- data2$`rate of inflation`
y <- data2$`log GDP`

delta_r <- diff(r)
delta_r <- delta_r[3:length(delta_r)]

pi_lag1 <- pi[2:length(pi)]
pi_lag1 <- pi_lag1[3:length(pi_lag1)]

delta_y_lag1 <- diff(y)
delta_y_lag1 <- delta_y_lag1[2:(length(delta_y_lag1) - 1)]

delta_r_lag1 <- diff(r)
delta_r_lag1 <- delta_r_lag1[2:(length(delta_r_lag1) - 1)]

delta_r_lag2 <- diff(r)
delta_r_lag2 <- delta_r_lag2[1:(length(delta_r_lag2) - 2)]
ndat <- data.frame(delta_r, pi_lag1, delta_y_lag1, delta_r_lag1, delta_r_lag2)

mod5 <- lm(delta_r ~ pi_lag1 + delta_y_lag1 + delta_r_lag1 + delta_r_lag2, data = ndat)
print(summary(mod5))

fitval <- fitted(mod5)
resval <- residuals(mod5)
year <- data2$Year[4:length(data2$Year)]
year <- as.character(year)
quarter <- data2$Quarter[4:length(data2$Quarter)]
quarter <- as.character(quarter)
names(quarter) <- year
#fitval
plot(fitval, bty = 'n', col = "#5F9EA0", pch = 16, axes=F, xlab = "", ylab = "fitted values")
axis(1, at = c(1:length(fitval)), labels = c(names(quarter)), line = 1)
axis(1, at = c(1:length(fitval)), labels = c(quarter), line = 3)
axis(2, c(seq(-1.35,1.35,0.10)))
#residuals
plot(resval, bty = 'n', col = "#e51636ff", pch = 16, axes=F, xlab = "", ylab = "residuals")
axis(1, at = c(1:length(fitval)), labels = c(names(quarter)), line = 1)
axis(1, at = c(1:length(fitval)), labels = c(quarter), line = 3)
axis(2, c(seq(-4.00,4.00,0.25)))

mod6 <- lm(resval ~ fitval)
print(summary(mod6))

mod7 <- lm(fitval ~ resval)
print(summary(mod7))

mod8 <- lm(delta_r ~ delta_y_lag1 + delta_r_lag1 + delta_r_lag2, data = ndat)
print(summary(mod8))

e_hat <- residuals(mod8)

mod9 <- lm(pi_lag1 ~ delta_y_lag1 + delta_r_lag1 + delta_r_lag2, data = ndat)
print(summary(mod9))

v_hat <- residuals(mod9)

mod10 <- lm(e_hat ~ v_hat, data = ndat)
print(summary(mod10))
print(summary(mod5))



