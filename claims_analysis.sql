-- Claims Denial Analysis
-- This file contains SQL queries used to analyze claim denials,
-- denial rates, payer trends, and appeal outcomes.
SELECT COUNT(*) AS total_claims
FROM claims;
SELECT COUNT(*) AS denied_claims
FROM claims
WHERE claim_status = 'Denied';
SELECT 
  ROUND(
    SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) * 1.0 
    / COUNT(*) * 100, 
    2
  ) AS denial_rate_percent
FROM claims;
SELECT 
  payer,
  COUNT(*) AS denied_claims
FROM claims
WHERE claim_status = 'Denied'
GROUP BY payer
ORDER BY denied_claims DESC;
SELECT 
  denial_reason,
  COUNT(*) AS denial_count
FROM claims
WHERE claim_status = 'Denied'
GROUP BY denial_reason
ORDER BY denial_count DESC;
SELECT 
  denial_reason,
  COUNT(*) AS denial_count
FROM claims
WHERE claim_status = 'Denied'
GROUP BY denial_reason
ORDER BY denial_count DESC;
