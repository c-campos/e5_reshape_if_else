#Exercise #5

#Practice the following skills:
  # reshape data frames
  # if_else statements

#Part 1: version control --------------------------------------------
# Please track changes to your script using version control. Include in your homework the URL to your completed homework assignment available on your
#GitHub repository
    
    #Github URL below:
    browseURL('https://github.com/c-campos/e5_reshape_if_else')

#Part 2: reshaping data frames ---------------------------------------------

#Using the 'batting.2008.Rdata' dataset, please do the following

#1) Using the spread() function, please create a data frame that shows the total number of home runs (HR) for each birthYear for
  #each team (use the teamID column) aggregated by player

  d.spread.prep <- d %>% group_by(birthYear,teamID) %>% summarise(total.HR = sum(HR))
  
  d.spread <- spread(data = d.spread.prep, key = teamID, value = total.HR)
  
#2) Subset the data for the Houston Astros (HOU). Using the gather() function, create a new data frame that has 3 columns:

  d.sub2 <- subset(x = d, subset = teamID == 'HOU')

  # (1) playerID, (2) variable containing (AB, R, H, 2B, 3B) and (3) column with the corresponding values for the stats.

  d.gath.prep <- d.sub2[,c('playerID', 'AB', 'R', 'H', '2B', '3B')] #pulling out the columns we want to use for our gather data
  
  d.gath <- gather(data = d.gath.prep, key = stat.type, value = value, 2:6)
  

#3) Repeat the process for Question 2. However, this time, please use the melt() function from the 'reshape2' package.

  d.melt <- melt(data = d.gath.prep, id = c('playerID'))

#4) Using the dcast() function from the 'reshape2 package', find the mean number of AB, R, H, 2B, 3B for each player (use 'playerID' to aggregate).

  d.dcast <- dcast(data = d.melt, formula = playerID~variable, fun.aggregate = mean)
  
#Part 3: if_else statements -------------------------------

# one condition
#5) generate an if_else statment to test if the value of a numeric object is positive number

  obj <- runif(n=1) #get random number
  
  if_else(condition = obj>0, true = 'Positive number', false = 'Negative number')
  
#6) using the two objects below, please generate an if_else statement that uses logical operator (i.e, !=, ==, >, etc.)
  # in the test

  x <- 5
  y <- 8
  
  if_else(condition = x>y, true = 'True', false = 'False')
   

#7) Hamlet's quandry: In Shakespeare's play Hamlet, the lead character has a famous speech "to be or not to be".
browseURL("https://www.poetryfoundation.org/poems/56965/speech-to-be-or-not-to-be-that-is-the-question")
# Write an if_else statement using the "to be' or 'not to be' for outcomes of the 'yes' and 'no' arguments respectively.

Hamlet <- 'Yes'

if_else(condition = Hamlet == 'Yes', true = 'to be', false = 'not to be')

#two or more conditions
#8) create an 'if else' statement that returns (in order of preference) your four ideal pizza toppings

pizza <- 4

if_else(condition = pizza>0, true = 'Cheese, Sausage, Pepperoni, Green Chile', false = 'no anchovies')

#two or more conditions joined (new content)
#To join two or more conditions into a single if statement, use logical operators viz. && (and), || (or) and ! (not).

  #example:
  x <- 7
  y <- 5
  z <- 2
  if(x > y && x > z) {
    print("x is greater")
  }

#9) generate your own 'if' statement using multiple conditions in one line

  ab <- 4
  ac <- 5
  bc <- 6
  
  if(ab<ac && bc>ac) {
    print('cool')
  }

#New content: understanding a common warning/error message when using if_else.
# The follow set of code will generate a warning message. Explain in a comment what the warning is telling you.
  v <- 1:6
  
  if(v %% 2) {
    print("odd")
  } else {
    print("even")
  }

  # The error is telling me that the object 'v' is too long to use for the if...else format. This is because 'if...else' does not work on an entire vector object at once, it can only operate on a single variable of the vector at a time.
