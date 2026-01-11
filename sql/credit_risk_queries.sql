#Overall loan acceptance rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(Personal_Loan) AS loan_customers,
    ROUND(AVG(Personal_Loan) * 100, 2) AS loan_acceptance_rate_pct
FROM loan_customers;

#Loan acceptance by income segment
SELECT 
    CASE 
        WHEN Income < 50 THEN 'Low Income'
        WHEN Income BETWEEN 50 AND 100 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_segment,
    COUNT(*) AS customers,
    ROUND(AVG(Personal_Loan) * 100, 2) AS acceptance_rate_pct
FROM loan_customers
GROUP BY income_segment
ORDER BY acceptance_rate_pct DESC;

#Loan acceptance by education level
SELECT 
    Education,
    COUNT(*) AS customers,
    ROUND(AVG(Personal_Loan) * 100, 2) AS acceptance_rate_pct
FROM loan_customers
GROUP BY Education
ORDER BY acceptance_rate_pct DESC;

#High-risk exposure proxy (high income + loan taken)
SELECT 
    COUNT(*) AS high_exposure_customers
FROM loan_customers
WHERE Income > 100 AND Personal_Loan = 1;

