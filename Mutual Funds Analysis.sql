-- Retrieve all columns from the comprehensive_mutual_funds_data table
select * from comprehensive_mutual_funds_data;

-- Retrieve specific columns (scheme_name, min_sip, min_lumpsum, fund_size_cr) from the table
select scheme_name, min_sip, min_lumpsum, fund_size_cr from comprehensive_mutual_funds_data;

-- Retrieve all columns from the table where risk_level is greater than 3 and returns_1yr is greater than 5
select * from comprehensive_mutual_funds_data
where risk_level > 3 and returns_1yr > 5;

-- Calculate and display the average returns for the 1st, 3rd, and 5th years
select round(Avg(returns_1yr),2) as Average_return_of_1st_year, 
       ROUND(avg(returns_3yr),2) as Average_return_of_3rd_year,
       ROUND(avg(returns_5yr),2) as Average_return_of_5th_year 
from comprehensive_mutual_funds_data;

-- Retrieve specific columns for funds with risk level greater than or equal to 4 and standard deviation rounded to 3 decimal places greater than or equal to 10
select scheme_name, risk_level, sd from comprehensive_mutual_funds_data
where risk_level >= 4 and ROUND(sd, 3) >= 10;

-- Display the top 5 fund managers based on their average returns
Select top 5 fund_manager, Avg(returns_1yr) as Average_return 
from comprehensive_mutual_funds_data
group by fund_manager
order by Average_return desc;

-- Retrieve scheme names and alpha values for funds with positive alpha
SELECT scheme_name, alpha
FROM comprehensive_mutual_funds_data
WHERE alpha > 0;

-- Calculate and display the average returns for each sub-category, ordered by average returns in descending order
select sub_category, Avg(returns_1yr) as avg_returns_1yr 
from comprehensive_mutual_funds_data
group by sub_category
order by avg_returns_1yr desc;

-- Retrieve scheme names, expense ratios, and 1-year returns for funds with returns greater than 5, ordered by expense ratio
SELECT scheme_name, expense_ratio, returns_1yr
FROM comprehensive_mutual_funds_data
WHERE returns_1yr > 5
ORDER BY expense_ratio;

-- Calculate and display the average 3-year returns for each fund age, ordered by fund age
SELECT fund_age_yr, AVG(returns_3yr) AS avg_returns_3yr
FROM comprehensive_mutual_funds_data
GROUP BY fund_age_yr
ORDER BY fund_age_yr;

-- Rank funds based on 1-year returns in descending order
select scheme_name, returns_1yr,
Rank() over(order by returns_1yr desc)
from comprehensive_mutual_funds_data;

-- Calculate and display rolling average 1-year returns for each fund, ordered by fund age
SELECT scheme_name, returns_1yr,
       AVG(returns_1yr) OVER (ORDER BY fund_age_yr) AS rolling_avg_returns
FROM comprehensive_mutual_funds_data;

-- Rank fund managers based on their average 3-year returns in descending order
SELECT fund_manager, AVG(returns_3yr) AS avg_returns_3yr,
       RANK() OVER (ORDER BY AVG(returns_3yr) DESC) AS manager_rank
FROM comprehensive_mutual_funds_data
GROUP BY fund_manager;

-- Calculate and display cumulative 1-year returns for each fund, ordered by fund age
SELECT scheme_name, returns_1yr,
       SUM(returns_1yr) OVER (ORDER BY fund_age_yr) AS cumulative_returns
FROM comprehensive_mutual_funds_data;
