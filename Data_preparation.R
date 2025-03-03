#
# Data preparation
#

# Install and load required packages
install.packages("tidyverse")  # Run this if you haven't installed tidyverse
library(tidyverse)

# 1. Load Data
sales_data <- read_csv("sales_data.csv")

# 2. Inspect Data
glimpse(sales_data)    # View structure of the dataset
summary(sales_data)    # Summary statistics
head(sales_data)       # View first few rows
colnames(sales_data)   # Column names

# 3. Handling Missing Values
sales_data <- sales_data %>%
  mutate(Sales = replace_na(Sales, 0))  # Replace NA in Sales column with 0

sales_data <- sales_data %>%
  drop_na(Customer_ID)  # Remove rows where Customer_ID is missing

# 4. Convert Date Formats
sales_data <- sales_data %>%
  mutate(Date = lubridate::mdy(Date))  # Convert multiple date formats to standard YYYY-MM-DD

# 5. Correct Inconsistent Data
sales_data <- sales_data %>%
  mutate(Category = str_to_title(Category))  # Standardize category names (Furniture, Electronics)

# 6. Remove Outliers
sales_data <- sales_data %>%
  filter(Quantity >= 0)  # Remove rows where Quantity is negative

# 7. Rename Columns for Clarity
sales_data <- sales_data %>%
  rename(OrderDate = Date, ProductCategory = Category)

# 8. Reshape Data for Analysis
sales_long <- sales_data %>%
  pivot_longer(cols = c(Sales, Quantity), names_to = "Metric", values_to = "Value")

sales_wide <- sales_long %>%
  pivot_wider(names_from = Metric, values_from = Value)

# 9. Remove Duplicates
sales_data <- sales_data %>%
  distinct()

# 10. Save the Cleaned Data
write_csv(sales_data, "cleaned_sales_data.csv")

# View final cleaned dataset
print(sales_data)
