# Data-Anlysis
# Pizza Sales Analysis Project 🍕

## Overview
This project focuses on analyzing pizza sales data to uncover insights into sales performance, customer preferences, and trends. The dataset, covering sales from January 15 to December 15, 2015, is processed using SQL for database creation, normalization, and querying. Key performance indicators (KPIs) such as total revenue, average order value, and top-selling pizzas are calculated and visualized in a comprehensive dashboard.

## Dataset
The dataset (`pizza_sales.csv`) contains pizza sales data with the following columns:
- `pizza_id`: Unique identifier for each pizza sold
- `order_id`: Unique identifier for each order
- `pizza_name_id`: Identifier for pizza type
- `quantity`: Number of pizzas sold in the order
- `order_date`: Date of the order
- `order_time`: Time of the order
- `unit_price`: Price per pizza
- `total_price`: Total price for the order (quantity * unit_price)
- `pizza_size`: Size of the pizza (S, M, L, XL, XXL)
- `pizza_category`: Category of the pizza (Classic, Supreme, Veggie, Chicken)
- `pizza_ingredients`: Ingredients used in the pizza
- `pizza_name`: Name of the pizza

## Methodology
1. **Database Creation**:
   - Created a new database named `Normalized Pizza DB` using SQL.
   - Imported the dataset into a table (`pizza_sales`) using `BULK INSERT`.

2. **Normalization**:
   - Split the `pizza_sales` table into two normalized tables:
     - `Pizza_Menu`: Contains pizza details (pizza_name_id, pizza_size, pizza_name, pizza_category, pizza_ingredients, unit_price).
     - `New_pizza_sales`: Contains transactional data (order_id, pizza_name_id, quantity, order_date, order_time).
   - Established relationships using primary and foreign keys.

3. **Key Performance Indicators (KPIs)**:
   - Calculated KPIs such as Total Revenue, Average Order Value, Total Pizzas Sold, Total Orders, and Average Pizzas per Order.
   - Analyzed trends (daily and monthly) and sales performance by pizza category, size, and name.

4. **Visualization**:
   - Created a dashboard to visualize KPIs, trends, and top/bottom performers using bar charts, pie charts, and line graphs.

## Key Findings
- **Total Revenue**: $817,860
- **Average Order Value**: $38.31
- **Total Pizzas Sold**: 49,574
- **Total Orders**: 21,350
- **Average Pizzas per Order**: 2.32
- **Best Sellers**:
  - **Revenue**: The Thai Chicken Pizza ($43,434)
  - **Quantity**: The Classic Deluxe Pizza (2,453 units)
  - **Total Orders**: The Classic Deluxe Pizza (2,329 orders)
- **Worst Sellers**:
  - **Revenue**: The Brie Carre Pizza ($11,588)
  - **Quantity**: The Brie Carre Pizza (490 units)
  - **Total Orders**: The Brie Carre Pizza (480 orders)
- **Trends**:
  - Busiest days are Fridays (3,538 orders) and Thursdays (3,239 orders).
  - Highest monthly orders in July (1,935 orders) and lowest in December (1,680 orders).
- **Sales Performance**:
  - Classic category contributes the most to sales (26.91% of revenue, 14,888 units sold).
  - Large-sized pizzas dominate sales (45.89% of revenue).

## Dashboard
Below is a screenshot of the Pizza Sales Dashboard visualizing the KPIs and trends:

![Dashboard 1] (https://github.com/MomenSabry/Data-Anlysis/blob/main/Home%20Dashboard.png)
## Project Structure
