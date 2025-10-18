#read in data to R
data <- read.csv('2025-10-17T02-13_export.csv', stringsAsFactors =  F)

#this requires library(tidyr)
#transform data into wide form
ndat_wide <- reshape(data = data, idvar = 'Country', timevar = 'Variable.code', direction = 'wide')
write.csv(ndat_wide, file='macro_assign1_pwt.csv', row.names = F)


#read in data to R
data <- read.csv('macro_assign1_pwt_1960.csv', stringsAsFactors =  F)

#this requires library(tidyr)
#transform data into wide form
ndat_wide <- reshape(data = data, idvar = 'Country', timevar = 'Variable', direction = 'wide')
names(ndat_wide) <- c('Country', 'emp_1960', 'pop_1960', 'rgdpna_1960')
write.csv(ndat_wide, file='macro_assign1_pwt_1960_wide.csv', row.names = F)


#read in data to R
data <- read.csv('US CA.csv', stringsAsFactors =  F)

#transform data into long form

ndat_long <- reshape(data = data, timevar = 'Variable.code', times = 1950:2023, varying = list(names(data)[3:ncol(data)]), v.names = 'Value' ,direction = 'long')
id <- rep(c('pop', 'rgdpna'), 148)
ndat_long$id <- id
names(ndat_long) <- c('Country', 'Year', 'Value', 'Variable.code')
write.csv(ndat_wide, file='US_CA_long.csv', row.names = F)
