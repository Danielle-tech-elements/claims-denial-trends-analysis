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


-- Total dollar amount denied
SELECT 
  SUM(claim_amount) AS total_denied_amount
FROM claims
WHERE claim_status = 'Denied';


-- Denied dollar amount by payer
SELECT 
  payer,
  SUM(claim_amount) AS denied_amount
FROM claims
WHERE claim_status = 'Denied'
GROUP BY payer
ORDER BY denied_amount DESC;


-- Appeal volume and success rate
SELECT
  appeal_submitted,
  COUNT(*) AS claim_count
FROM claims
WHERE claim_status = 'Denied'
GROUP BY appeal_submitted;


-- Appeal success rate
SELECT
  ROUND(
    SUM(CASE WHEN appeal_outcome = 'Approved' THEN 1 ELSE 0 END) * 1.0
    / COUNT(*) * 100,
    2
  ) AS appeal_success_rate_percent
FROM claims
WHERE appeal_submitted = 'Y';
