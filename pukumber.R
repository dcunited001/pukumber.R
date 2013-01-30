
# library(plyr)
# library(lattice)


 

# Testing
#==============================

isEmpty <- function(str) {( nchar(str) == 0 )}
printUnlessEmpty <- function(str) { if (!isEmpty(str)) {print(str)} }

testStartStr <- '-----[ START ]-----'
testPassedStr <- '=====[ PASSED ]====='
testFailedStr <- '=====[ FAILED ]====='
testDivStr <- '--------------------'

runAssert <- function(expr,title='',...) {
  cat("\n\n",testStartStr,"\n",title,"\n")
  toReturn <- tryCatch(expr,...,error=function(e) printError(e))
  cat(testDivStr,"\n"); toReturn; }

printError <- function(e) {
  cat(testErrorStr, "\n", toString(e), "\n", e$message, "\n", testErrorStr, "\n")}

printExpected <- function(actual,expected) {
  cat('Expected <',actual,'> to be <',expected, '>', "\n", sep=' ') }

assertEqual <- function(expr,exp,...) {
  if ((val <- runAssert(expr,...)) == exp) cat(testPassedStr,"\n")
  else { printExpected(val, exp); cat(testFailedStr,"\n") }}

assertTrue <- function(expr,...) { assertEqual(expr,TRUE,...) }

assertFalse <- function(expr,...) { assertEqual(expr,FALSE,...) }

# probably could do some funkshional ish here
#   oh well, congrats on being the 1st person to read this
assertNull <- function(expr,...) {
  if (is.null(val <- runAssert(expr,...))) cat(testPassedStr,"\n")
  else { printExpected(val, 'NOT NULL'); cat(testFailedStr,"\n") }}

assertNotNull <- function(expr,...) {
  if (!is.null(val <- runAssert(expr,...))) cat(testPassedStr,"\n")
  else { printExpected(val, 'NOT NULL'); cat(testFailedStr,"\n") }}

testCatchPass <- function() {
  tryCatch(print("passes"),
                      error = function(e) printError(e),
                      finally=print("finished")) }

testCatchFail <- function() {
  tryCatch(stop("fails"),
                      error = function(e) printError(e),
                      finally=print("finished")) }







