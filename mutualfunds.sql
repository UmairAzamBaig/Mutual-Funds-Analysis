select * from comprehensive_mutual_funds_data

select scheme_name , min_sip , min_lumpsum , fund_size_cr from comprehensive_mutual_funds_data

select * from comprehensive_mutual_funds_data

where risk_level>3 and returns_1yr>5 

select round(Avg(returns_1yr),2) as Average_return_of_1st_year, ROUND(avg(returns_3yr),2) as Average_return_of_3rd_year
, ROUND(avg(returns_5yr),2) as Average_return_of_5th_year from comprehensive_mutual_funds_data

select scheme_name , risk_level , sd from comprehensive_mutual_funds_data
where risk_level>=4 and ROUND(sd, 3) >= 10;


Select top 5 fund_manager , Avg(returns_1yr) as Average_return from comprehensive_mutual_funds_data
group by fund_manager
order by Average_return desc



SELECT   scheme_name, alpha
FROM comprehensive_mutual_funds_data
WHERE alpha > 0;





select sub_category , Avg(returns_1yr) as avg_returns_1yr from comprehensive_mutual_funds_data
group by sub_category
order by avg_returns_1yr desc


SELECT scheme_name, expense_ratio, returns_1yr
FROM comprehensive_mutual_funds_data
WHERE returns_1yr > 5
ORDER BY expense_ratio;


SELECT fund_age_yr, AVG(returns_3yr) AS avg_returns_3yr
FROM comprehensive_mutual_funds_data
GROUP BY fund_age_yr
ORDER BY fund_age_yr;


select scheme_name , returns_1yr ,
Rank() over(order by returns_1yr desc)
from comprehensive_mutual_funds_data

SELECT scheme_name, returns_1yr,
       AVG(returns_1yr) OVER (ORDER BY fund_age_yr) AS rolling_avg_returns
FROM comprehensive_mutual_funds_data;



SELECT fund_manager, AVG(returns_3yr) AS avg_returns_3yr,
       RANK() OVER (ORDER BY AVG(returns_3yr) DESC) AS manager_rank
FROM comprehensive_mutual_funds_data
GROUP BY fund_manager;


SELECT scheme_name, returns_1yr,
       SUM(returns_1yr) OVER (ORDER BY fund_age_yr) AS cumulative_returns
FROM comprehensive_mutual_funds_data;











