
select 
month,
SUM(TICKET_MONTH)

FROM (
SELECT 
EXTRACT(MONTH FROM SUBSCRIPTION_START_DATE) AS month,
CLINIC_ID,
BILLING_INTERVAL_IN_MONTHS,
FIRST_PAYMENT_AMOUNT, 
FIRST_PAYMENT_AMOUNT/ BILLING_INTERVAL_IN_MONTHS AS TICKET_MONTH  
FROM capim.subscriptions_table where CHECKOUT_STATUS = 'complete' and SUBSCRIPTION_STATUS = 'active')
group by 1