CREATE TABLE `activity` (
  `CLINIC_ID` integer,
  `ACTIVITY_AT` timestamp,
  `ACTIVITY_TYPE` string,
  `FEATURE` string,
  `MODULE` string,
  `ANALYTICS_DOMAIN` string,
  `IS_TRANSACTION` boolean,
  `IS_BNPL_ACTIVITY` boolean,
  `IS_VALID_ACTIVITY` boolean,
  `IS_DELETION_ACTIVITY` boolean,
  `IS_MANAGEMENT_ACTIVITY` boolean,
  `IS_FINANCE_ACTIVITY` boolean,
  `ACTIVITY_ID` SERIAL PRIMARY KEY
);

CREATE TABLE `clinics` (
  `CLINIC_ID` integer PRIMARY KEY,
  `CLINIC_CREATED_AT` timestamp,
  `BUSINESS_SEGMENTATION` string,
  `IS_CHAIN_CLINIC` boolean,
  `FIRST_USER_HUBSPOT_SOURCE` string,
  `INTEREST_REASONS` list,
  `INTEREST_CATEGORY_SIGNUP` string,
  `HAS_INTEREST_BNPL` boolean,
  `HAS_INTEREST_BNPL_ONLY` boolean,
  `HAS_INTEREST_SAAS` boolean,
  `TRIAL_DURATION` integer,
  `TRIAL_START_DATE` timestamp,
  `TRIAL_END_DATE` timestamp,
  `TRIAL_START_HOUR` integer,
  `TRIAL_START_HOUR_CATEGORY` string,
  `TRIAL_START_DAY_OF_WEEK` integer,
  `TRIAL_START_DAY_OF_WEEK_CATEGORY` string,
  `HAS_USER_CREATED` boolean,
  `MARKETING_ATTRIBUITION` string,
  `MARKETING_ATTRIBUITION_CHANNEL_GROUP` string,
  `MARKETING_ATTRIBUITION_CAMPAIGN` string,
  `MARKETING_ATTRIBUITION_CAMPAIGN_PRODUCT` string,
  `MARKETING_ATTRIBUITION_AD_GROUP` string,
  `IS_PAID_MEDIUM` boolean,
  `HAS_ASKED_FOR_ACCREDITATION` boolean,
  `HAS_STARTED_ACCREDITATION_AND_NOT_FINISHED` boolean,
  `IS_ACCREDITATION_APPROVED` boolean,
  `IS_ACCREDITATION_REPROVED` boolean,
  `CLINIC_ACCREDITATION_STATUS` string,
  `REQUEST_FINISHED_AT` timestamp,
  `ACCREDITATION_REQUESTED_AT` timestamp,
  `ACCREDITATION_APPROVED_AT` timestamp,
  `ACCREDITATION_REJECTED_AT` timestamp
);

CREATE TABLE `subscriptions` (
  `CLINIC_ID` integer,
  `STRIPE_SUBSCRIPTION_ID` varchar(255) PRIMARY KEY,
  `SUBSCRIPTION_START_DATE` timestamp,
  `SUBSCRIPTION_END_DATE` timestamp,
  `SUBSCRIPTION_CURRENT_PERIOD_STARTED_AT` timestamp,
  `SUBSCRIPTION_CURRENT_PERIOD_ENDS_AT` timestamp,
  `MOST_RECENT_INVOICE_CREATED_AT` timestamp,
  `LAST_PAYMENT_AT` timestamp,
  `CHECKOUT_STATUS` string,
  `SUBSCRIPTION_STATUS` string,
  `BILLING_INTERVAL_IN_MONTHS` integer,
  `FIRST_PAYMENT_METHOD_TYPE` string,
  `FIRST_CARD_BRAND` string,
  `FIRST_PAYMENT_AMOUNT` float,
  `FIRST_PAYMENT_AMOUNT_OFF` float,
  `FIRST_PAYMENT_PROMOTION_CODE` string,
  `FIRST_PAYMENT_COUPON_ID` varchar(255),
  `FIRST_PAYMENT_AMOUNT_OFF_2` float
);

ALTER TABLE `activity` ADD FOREIGN KEY (`CLINIC_ID`) REFERENCES `clinics` (`CLINIC_ID`);

ALTER TABLE `subscriptions` ADD FOREIGN KEY (`CLINIC_ID`) REFERENCES `clinics` (`CLINIC_ID`);
