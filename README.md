✨ **This is a self-learning and fun project.**



# Project Background
Cafe Cozy is a fictional café that sells pastries and beverages through both in-store and takeaway orders.

The company collects detailed sales data from daily transactions, and operates a straightforward business model where customers place and pay for orders at the counter. This project analyzes and synthesizes that sales data to uncover insights that can help improve Cafe Cozy’s commercial performance and support data-driven decision making.

Insights and recommendations are provided on the following key areas:

- **Sales Performance:** How much the cafe is selling and how revenue is trending.
- **Product Performance:** Which items sell the most and contribute most to revenue.   
- **Customer & Order Behaviour:** How customers buy, including order spize, spend, and channel (in-store vs takeaway).
- **Payment Behaviour:** Which payment methods customers prefer and how they impact spending. 

The SQL queries used to inspect and clean the data for this analysis can be found [here](https://github.com/meepysaur/cafe_analysis/blob/main/Cafe_Data_Clean.sql).

An interactive Power BI dashboard used to report and explore sales trends can be found [here](https://github.com/meepysaur/cafe_analysis/blob/main/Cafe_BI.pbix).



# Executive Summary

### Overview of Findings

In 2023, Cafe Cozy has generated a total of $76,765.50 in revenue. Across these transactions, the café sold 25,963 units, resulting in an average order value (AOV) of $8.93 and an average basket size of 3.0 items per order. Revenue is almost evenly split between channels, with 50.3% coming from in-store purchases and 49.7% from takeaway. Based on these results, the following sections will explore the key drivers behind performance and highlight opportunities to further improve commercial outcomes.

Below is the overview page from the Power BI dashboard:

<img width="1157" height="645" alt="image" src="https://github.com/user-attachments/assets/c0b59503-0b11-460d-a9dd-cd236cff4559" />



# Insights Deep Dive
### Sales Performance: 

* The company’s sales peaked in June 2023, generating $6,684.50 in monthly revenue. This suggests that warmer weather may increase customer foot traffic and demand for beverages and cold items such as Smoothies and Juices.
  
* Revenue remains very steady month-to-month, averaging between $6,400 and $6,600. This stability indicates consistent demand and likely repeat purchasing behaviour across the year.
  
* Revenue is almost perfectly balanced across channels, with 50.3% coming from in-store purchases and 49.7% from takeaway orders. This highlights that both channels are equally important, meaning operational planning, staffing, stock levels, and marketing strategies should continue to support both dine-in and takeaway customers.

<img width="1051" height="309" alt="image" src="https://github.com/user-attachments/assets/c1c4c260-d5ee-4a8b-8473-2bb03866acd3" />




### Product Performance:

* Salads and Sandwiches are the two largest revenue contributors in 2023, generating $16,455 and $14,048 respectively.
  
* Across 2023, the café sold a total of 25,963 product units. Coffee alone accounted for 3,686 units, making it the single most frequently purchased item. This confirms Coffee as a daily anchor product that reliably attracts customers and supports repeat visits.
  
* A key trend emerging from the 2023 data is that revenue growth is supported by a balanced mix of core meal products and daily-habit purchases. Coffee and Cake help generate consistent transaction volume throughout the year, while premium items such as Salads, Sandwiches, and Smoothies lift average order value and revenue per visit.

<img width="1092" height="294" alt="image" src="https://github.com/user-attachments/assets/bdf3cf98-446d-41ec-8e55-a7834bc35c18" />



### Customer & Order Behaviour:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Payment Behaviour:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 4]



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
* Assumed that every transaction_id accounted for 1 unique customer.
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
