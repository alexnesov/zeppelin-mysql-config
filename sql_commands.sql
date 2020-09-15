create table financetest (no int(5), ticker varchar(10) primary key, company varchar(200), 
sector varchar(90), industry varchar(250),country varchar(30), market_cap float(25), p_e float(8), 
price float(8), change_ float(8), volume int(10));

LOAD DATA INFILE '/var/lib/mysql-files/US_STOCKS/US_STOCKS_09_06_2020/Overview.csv'
INTO TABLE financetest
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

