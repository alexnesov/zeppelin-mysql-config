<h4> Regarding MySQL per se:</h4>

Steps reproduced to avoid "mysql: [Warning] World-writable config file '/etc/mysql/my.cnf' is ignored.":
```
sudo chown root:root /etc/mysql/my.cnf
sudo chmod 0400 my.cnf
sudo service mysql restart
```

Steps to reproduce to disable secure priv for data loading:

```mysql> select @@GLOBAL.secure_file_priv;```
Place files in the directory that appears


Steps to reproduce to avoid "Loading local data is disabled; this must be enabled on both the client and server sides":
```
SET GLOBAL local_infile=1;
quit
```


Steps to reproduce to avoid: "LOAD DATA LOCAL INFILE file request rejected due to restrictions on access.":
```
sudo chmod 755 /var/lib/mysql-files/
```
