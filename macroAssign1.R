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
ndat_wide <- reshape(data = data, idvar = 'Country', timevar = 'Variable.code', direction = 'wide')
write.csv(ndat_wide, file='macro_assign1_pwt.csv', row.names = F)