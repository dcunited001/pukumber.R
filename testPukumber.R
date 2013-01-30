source('pukumber.R')


abc <- c('a','b','c')
digits <- c(1:9)

assertTrue(abc[1] == 'a')
assertFalse(abc[2] == 'a')

assertNull(NULL)
assertNotNull(digits)

