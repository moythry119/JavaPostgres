CREATE TABLE acc_chartofaccount (
    id SERIAL PRIMARY KEY,
    coaaccountno VARCHAR(20),
    coaaccountname VARCHAR(100),
    coacurrencycode VARCHAR(10)
);