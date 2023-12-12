with first_subscription as (
SELECT DISTINCT 
CLINIC_ID, 
MIN(SUBSCRIPTION_START_DATE) AS FIRST_SUBSCRIPTION_START_DATE
FROM capim.subscriptions_table
WHERE CHECKOUT_STATUS in ('open', 'complete')
GROUP BY CLINIC_ID

), 

intermediate_table as (
SELECT c.*,
 fs.FIRST_SUBSCRIPTION_START_DATE,
 CASE WHEN fs.FIRST_SUBSCRIPTION_START_DATE is not null THEN  True else False end  as IS_CONVERTED,
from capim.clinics_table c
left join  first_subscription fs ON fs.CLINIC_ID = c.CLINIC_ID
where TRIAL_START_DATE is not null)

SELECT
IS_CHAIN_CLINIC,
DATE_TRUNC(TRIAL_START_DATE, MONTH) AS YEAR_MONTH,
COUNT(DISTINCT CLINIC_ID) as CLINICS_IN_TRIAL,
sum(case when IS_CONVERTED is True then 1 else 0 end ) AS CLINICS_CONVERTED,
sum(case when IS_CONVERTED is True then 1 else 0 end )/COUNT(DISTINCT CLINIC_ID)*100 as CONVERSION_RATE
FROM intermediate_table
GROUP BY 1,2

