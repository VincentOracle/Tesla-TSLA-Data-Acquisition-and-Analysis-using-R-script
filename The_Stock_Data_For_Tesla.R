# Install required packages
options(repos = c(CRAN = "https://lib.stat.cmu.edu/R/CRAN/"))

install.packages(c("tidyquant", "ggplot2")) # Just install if not available 

# Load the packages
library(tidyquant)
library(ggplot2)

# Sets the ticker symbol and date range
ticker <- "TSLA"
start_date <- "2023-01-01"
end_date <- Sys.Date()

# Download daily price data using tidyquant
stock_data <- tq_get(ticker,
                     get = "stock.prices",
                     from = start_date,
                     to = end_date)

# Export data to CSV file
write.csv(stock_data, file = "C:\\Users\\n\\Downloads\\Tesla_Daily_Prices.csv")

# Create a basic plot of the closing price with different colors
ggplot(stock_data, aes(x = date, y = close)) +
  geom_line(color = "blue") + # Change color here
  labs(title = "Tesla (TSLA) Daily Closing Price",
       x = "Date",
       y = "Closing Price") +
  theme_minimal() # Optional: improves the aesthetics
