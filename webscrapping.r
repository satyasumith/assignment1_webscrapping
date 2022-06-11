#install.packages("rvest")
#install.packages("dplyr")

library(rvest)
library(dplyr)

# SCRAPPING WEBSITE
link <- 
  'https://www.flipkart.com/mobiles/android~os/pr?sid=tyy%2C4io'

# HTML ELEMENTS FROM WEBSITE
web <- read_html(link)

# SEGREGATING NAMES
name <- web %>% html_nodes("._4rR01T") %>% html_text()

# VIEWING NAME LIST
View(name)

# SEGREGATING YEARS
cost <- web %>% html_nodes("._1_WHN1") %>% html_text()

# VIEW YEAR LIST
View(cost)

# SEGREGATING RATINGS
rating <- web %>% 
  html_nodes("._1lRcqv ._3LWZlK") %>% html_text()

# VIEW RATINGS LIST
View(rating)

# SEGREGATING THE DURATION
exchangevalue <- web %>% html_nodes(".col-12-12:nth-child(22) ._1_WHN1 , ._18hQoS:nth-child(2)") %>% html_text()

# VIEWING DURATION LIST
View(exchangevalue)

discount <- web %>% html_nodes("._3tbKJL span") %>% html_text()

View(discount)

# CREATING DATAFRAME
complete.details <- data.frame(name, cost, rating, exchangevalue,discount)

# VIEW DATAFRAME
View(complete.details)

# SAVING DATA
write.csv (complete.details, "assignment_1.csv")