# Project Background
Cafe Cozy is a fictional café that sells pastries and beverages through both in-store and takeaway orders.

The company collects detailed sales data from daily transactions, and operates a straightforward business model where customers place and pay for orders at the counter. This project analyzes and synthesizes that sales data to uncover insights that can help improve Cafe Cozy’s commercial performance and support data-driven decision making.

Insights and recommendations are provided on the following key areas:

1. **Sales Performance:** How much the cafe is selling and how revenue is trending.
2. **Product Performance:** Which items sell the most and contribute most to revenue.
3. **Customer & Order Behaviour:** How customers buy, including order size, spend, and channel (in-store vs takeaway).
4. **Payment Behaviour:** Which payment methods customers prefer and how they impact spending. 

The SQL queries used to inspect and clean the data for this analysis can be found [here](https://github.com/meepysaur/cafe_analysis/blob/main/Cafe_Data_Clean.sql).

An interactive Power BI dashboard used to report and explore sales trends can be found [here](https://github.com/meepysaur/cafe_analysis/blob/main/CafeCozy_BI.pbix).



# Executive Summary

### Overview of Findings

In 2023, Cafe Cozy has generated a total of $76,765.50 in revenue. Across these transactions, the café sold 25,963 units, resulting in an average order value (AOV) of $8.93 and an average basket size of 3.0 items per order. Revenue is almost evenly split between channels, with 50.3% coming from in-store purchases and 49.7% from takeaway. Based on these results, the following sections will explore the key drivers behind performance and highlight opportunities to further improve commercial outcomes.

Below is the overview page from the Power BI dashboard:

<img width="1281" height="712" alt="image" src="https://github.com/user-attachments/assets/d939bba9-e1b0-4488-814b-96b72fb7c6b7" />



# Insights Deep Dive
### 1. Sales Performance: 

* The company’s sales peaked in June 2023, generating $6,684.50 in monthly revenue. This suggests that warmer weather may increase customer foot traffic and demand for beverages and cold items such as Smoothies and Juices.
  
* Revenue remains very steady month-to-month, averaging between $6,400 and $6,600. This stability indicates consistent demand and likely repeat purchasing behaviour across the year.
  
* Revenue is almost perfectly balanced across channels, with 50.3% coming from in-store purchases and 49.7% from takeaway orders. This highlights that both channels are equally important, meaning operational planning, staffing, stock levels, and marketing strategies should continue to support both dine-in and takeaway customers.

<img width="1097" height="294" alt="image" src="https://github.com/user-attachments/assets/b8571427-ed41-4dfb-806f-c3549212553b" />



### 2. Product Performance:

* Salads and Sandwiches are the two largest revenue contributors in 2023, generating $16,455 and $14,048 respectively.
  
* Across 2023, the café sold a total of 25,963 product units. Coffee alone accounted for 3,686 units, making it the single most frequently purchased item. This confirms Coffee as a daily anchor product that reliably attracts customers and supports repeat visits.
  
* A key trend emerging from the 2023 data is that revenue growth is supported by a balanced mix of core meal products and daily-habit purchases. Coffee and Cake help generate consistent transaction volume throughout the year, while premium items such as Salads, Sandwiches, and Smoothies lift average order value and revenue per visit.

<img width="1128" height="286" alt="image" src="https://github.com/user-attachments/assets/66216532-1846-461b-82c7-419c9d2cfaa0" />



### 3. Customer & Order Behaviour:

* When analysing the AOV trend month-by-month, the data shows that AOV remains stable throughout the year, generally falling within the $8.70-$9.10 range per order. This consistency suggests that while the total number of transactions fluctuates slightly month-to-month, customer spending behaviour per visit is predictable and consistent.
  
* When comparing AOV by sales channel, both channels perform almost identically, indicating balanced customer spending patterns. There is no major difference in average ticket size between channels.
  
* In addition to stable AOV patterns, the café’s basket size remains consistent across 2023, averaging 3.0 items per transaction.

<img width="1116" height="334" alt="image" src="https://github.com/user-attachments/assets/085a9103-a79e-4605-8dad-acd54caa4c17" />



### 4. Payment Behaviour:

* Across 2023, transactions were almost evenly split across all three payment methods (i.e. Cash, Credit Card & Digital Wallet), with each accounting for roughly one-third of total orders. This suggests that customers show no strong preference for one specific payment method.
  
* When analysing AOV by payment method, customer spending remains consistently close to the café-wide AOV of around $9.00 per order.

* The combination of evenly distributed payment share and stable AOV across methods indicates predictable and reliable payment behaviour throughout 2023. This stability supports smooth operations, financial planning, and customer experience consistency, as the business is not overly dependent on any single payment channel.

<img width="1125" height="316" alt="image" src="https://github.com/user-attachments/assets/72464f19-04bd-42b4-8014-91c8d624e91c" />



# Recommendations

Based on the insights and findings above, we would recommend the Leadership Team (which is assumed to be a small group given the scale of the café) to consider the following: 

* **Sales Performance:** Continue resourcing both in-store and takeaway channels equally, as revenue contribution and AOV are almost identical. This includes staffing allocation, inventory planning, and marketing visibility for both formats. In addition, leverage seasonal peaks (especially mid-year months such as June) by running targeted promotions, such as summer beverage campaigns or light-meal bundlesm, to maximise naturally higher demand.
  
* **Product Performance:** Prioritise availability and visibility of high-revenue items such as Salads, Sandwiches, Smoothies, and Cakes, as these products materially drive total café revenue. Stock planning should minimise the risk of sell-outs. Use high-frequency anchor products such as Coffee and Cake to support upsell strategies, including bundle deals (e.g., Coffee + Cake, Lunch + Drink) to lift overall basket value.
  
* **Customer & Order Behaviour:** Introduce and optimise bundle-based promotions, as customers already purchase an average of three items per order. Bundles aligned to this behaviour are likely to perform strongly without requiring behavioural change. Develop loyalty or repeat-visit incentives (such as loyalty cards) to strengthen already-stable spending behaviour and encourage habitual purchasing patterns.
  
* **Payment Behaviour:** Maintain all three payment options (Cash, Credit Card, and Digital Wallet) as core offerings, given their balanced usage and equal contribution to sales. At the same time, continue to monitor emerging trends, particularly the growing preference among younger consumers for Digital Wallet payments. Continue improving checkout convenience, especially for digital and contactless users, as payment method preference appears to be driven primarily by ease and speed.
 


# Assumptions and Caveats

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Since Cake and Juice are both priced at $3, and Sandwich and Smoothie are both priced at $4, missing item names were inferred based on matching price values from the joined dataset. As multiple items share the same price point, there is a small risk that some inferred item labels may not perfectly match the original purchase.

* Missing Location and Payment Method values were re-coded and evenly distributed across the available categories. This approach ensured that incomplete records could still be included in the analysis, but it may slightly distort the true distribution of transactions across channels and payment types.
  
* Each Transaction_ID was assumed to represent one unique customer visit. As customer identifiers were not available, this assumption allows transaction-level analysis but may not capture scenarios where the same customer makes multiple purchases.
  
* Revenue was analysed using gross transaction value only, with no adjustments for discounts, taxes, or operational costs. Therefore, results reflect sales performance, not profitability.
