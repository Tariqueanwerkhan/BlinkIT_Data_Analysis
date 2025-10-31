# 🛒 Blinkit Data Analysis


## 📚 Table of Contents
- [🎯 Objective](#-objective)
- [📊 Key Business Requirement](#-key-business-requirement)
- [📊 Key Business Questions](#-key-business-questions)
- [🧼 Data Cleaning with Python](#-data-cleaning-with-python)
- [🐍 Sample Python Code](#-sample-python-code)
- [📈 Power BI Dashboard](#-power-bi-dashboard)
- [📂 Dataset Description](#-dataset-description)
- [🧠 Skills Used](#-skills-used)




---

## 🎯 Objective  
The purpose of this project is to perform an **end-to-end data analysis** on *Blinkit’s sales data* — a quick commerce company delivering groceries and essentials across India.  

The goal is to uncover **data-driven insights** to help the company identify trends in **sales performance, outlet type, item visibility, fat content, and customer ratings** using **SQL, Python, and Power BI**.  

This project demonstrates **data analytics thinking**, combining multiple tools to clean, analyze, and visualize real-world business data.


---


## 📊 Key Business Requirement
To conduct a comprehensive analysis of Blinkit's sales performance, customer satisfaction, and inventory distribution to identify key insights and opportunities for optimization using various KPIs and visualizations in Power BI.

KPI’s Requirements
Total Sales: The overall revenue generated from all items sold.
Average Sales: The average revenue per sale.
Number of Items: The total count of different items sold.
Average Rating: The average customer rating for items sold. 

Charts Requirements 
1. Total Sales by Fat Content:
	Objective: Analyze the impact of fat content on total sales.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
2. Total Sales by Item Type:
	Objective: Identify the performance of different item types in terms of total sales.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
3. Fat Content by Outlet for Total Sales:
	Objective: Compare total sales across different outlets segmented by fat content.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
4. Total Sales by Outlet Establishment:
	Objective: Evaluate how the age or type of outlet establishment influences total sales.
5. Percentage of Sales by Outlet Size:
	Objective: Analyze the correlation between outlet size and total sales.
6. Sales by Outlet Location:
	Objective: Assess the geographic distribution of sales across different locations.
7. All Metrics by Outlet Type:
	Objective: Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of 	Items, Average Rating) broken down by different outlet types.


---

## 📊 Key Business Questions  

1. **🏪 Outlet Performance**  
   Which outlet type generates the highest total sales and average sales?

2. **📦 Item Sales Analysis**  
   Which item types contribute most to total revenue?

3. **🍔 Fat Content Impact**  
   How does item fat content affect sales performance?

4. **🌆 Outlet Size & Location**  
   What’s the relationship between outlet size, tier location, and sales?

5. **⭐ Ratings & Visibility**  
   How do average ratings and visibility affect outlet success?

6. **📈 Yearly Trends**  
   How have sales changed over time across outlets?

---


## 🧼 Data Cleaning with Python  

Data cleaning and preprocessing were performed using **Python** to prepare the dataset for analysis.  

**Steps Followed:**  
1. Removed duplicate rows  
2. Handled missing values (using mean/mode)  
3. Renamed inconsistent column names  
4. Treated outliers using the IQR method  
5. Exported cleaned dataset for SQL and Power BI use


---

### 🐍 Sample Python Code
# Load dataset
df = pd.read_csv("C:/Users/charlie00/Downloads/Blinkit_Data.csv")


<img width="1626" height="779" alt="image" src="https://github.com/user-attachments/assets/1c497bf2-fc50-44cb-989f-b96592ce4e1d" />

<img width="1440" height="786" alt="image" src="https://github.com/user-attachments/assets/3d5c8401-4a4f-4151-a358-a390a9f612a3" />


---


## 📈 Power BI Dashboard
An interactive Power BI Dashboard was created to visualize:
Total Sales
Average Sales
Average Rating
Number of Items
Sales by Outlet Type, Location, and Size
Yearly Sales Trends
Fat Content & Item Type Distribution

<img width="598" height="343" alt="Blinkit_Analysis_dashboard" src="https://github.com/user-attachments/assets/489d6bba-76c1-4357-91e4-7b0f0d5a8bd6" />


<img width="601" height="341" alt="Blinkit_Analysis_dashboard img2" src="https://github.com/user-attachments/assets/c4e320f7-1664-4e1d-aa35-3189b929e183" />


---


## 📂 Dataset Description

| Column Name                 | Description                                      |
| --------------------------- | ------------------------------------------------ |
| `Item_Identifier`           | Unique product ID                                |
| `Item_Weight`               | Weight of the product                            |
| `Item_Fat_Content`          | Fat content (Low Fat / Regular)                  |
| `Item_Type`                 | Type of grocery item                             |
| `Item_MRP`                  | Maximum retail price                             |
| `Outlet_Identifier`         | Unique outlet code                               |
| `Outlet_Establishment_Year` | Establishment year of outlet                     |
| `Outlet_Size`               | Size of the outlet (Small / Medium / Large)      |
| `Outlet_Location_Type`      | Tier of the outlet’s location                    |
| `Outlet_Type`               | Type of the outlet (Supermarket / Grocery Store) |
| `Item_Outlet_Sales`         | Sales amount for each item-outlet combination    |
| `Rating`                    | Average customer rating                          |




## 🧠 Skills Used
Python → Data cleaning, preprocessing, and visualization (Pandas, NumPy, Matplotlib)
SQL → Data analysis using Joins, Group By, Aggregate & Subqueries
Power BI → Dashboard creation, DAX measures, KPIs, and data modeling
Excel → Data formatting, validation, and initial analysis
Statistics → Mean, Median, Correlation, Standard Deviation, Outlier Detection
Git & GitHub → Version control and project publishing

