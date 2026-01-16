-- Claims Denial Analysis
-- This file contains SQL queries used to analyze claim denials,
-- denial rates, payer trends, and appeal outcomes.


-- Total number of claims
SELECT COUNT(*) AS total_claims
FROM claims;


-- Total number of denied claims
SELECT COUNT(*) AS denied_claims
FROM claims
WHERE claim_status = 'Denied';


-- Overall denial rate (percentage)
SELECT 
  ROUND(
    SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) * 1.0 
    / COUNT(*) * 100, 
    2
  ) AS denial_rate_percent
FROM claims;


-- Denied claims by payer
SELECT 
  payer,
  COUNT(*) AS denied_claims
FROM claims
WHERE claim_status = 'Denied'
GROUP BY payer
ORDER BY denied_claims DESC;


-- Denied claims by denial reason
SELECT 
  denial_reason,
  COUNT(*) AS denial_count
FROM claims
WHERE claim_status = 'Denied'
GROUP BY denial_reason
ORDER BY denial_count DESC;

