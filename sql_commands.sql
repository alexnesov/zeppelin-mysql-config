CREATE TABLE financetest (no int(5), ticker varchar(10) primary key, company varchar(200),
sector varchar(90), industry varchar(250),country varchar(30), market_cap float(25) DEFAULT NULL, p_e float(8) DEFAULT NULL,price float(8), change_ float(8), volume int(10));

LOAD DATA LOCAL INFILE 'Overview.csv'
INTO TABLE financetest
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(no, ticker, company, sector, industry, country, @market_cap, @p_e, price, change_, volume)
SET
market_cap = NULLIF(@market_cap,''),
p_e = NULLIF(@p_e,'')
;
