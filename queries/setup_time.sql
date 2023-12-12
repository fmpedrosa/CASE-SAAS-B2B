

SELECT
AVG(days) as medium_time_for_setup
 FROM (
SELECT 
distinct
CLINIC_ID,
count(EXTRACT(DATE FROM ACTIVITY_AT) ) as days,
FROM `capim-404203.capim.activity_table`

WHERE module = 'setup'
group by 1)