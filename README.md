

<h4> Regarding Zeppelin-Python: </h4>

In my case (Ubuntu 20.x, Python 3.8.x):

In configs, replace ```python``` by ```python3```. Or create alias in ```PATH```

install pip3 first, then:
```
pip3 install jupyter
pip3 install grpcio
pip3 install protobuf
```

I noticed also that the Python interpreter won't work if the right permission are not set. One needs to recursively grant permissions to the current user: </br>
```sudo chown -R <user(and not root)>:<user(ant not root) zeppelin-0.9.0-preview2-bin-all/```

<h4> Regarding Zeppelin-MySQL: </h4>

To launch it, go in installation folder then:</br>
```cd /bin``` </br>
```./zeppelin-daemon.sh start```

UI, generally is at: </br>
```http://localhost:8080/#/``` </br>
In my case it was first accessible at: </br>
```http://127.0.0.1:8080/#/```

</br>
<h4> Regarding MySQL <i>per se</i> (DEBUGGING):</h4>


Check if Maven is installed:
```mvn verify```

If not then:
```sudo apt install maven```


<ul>Steps reproduced to avoid: ```mysql: [Warning] World-writable config file '/etc/mysql/my.cnf' is ignored.```:</ul>
```
sudo chown root:root /etc/mysql/my.cnf
sudo chmod 0400 my.cnf
sudo service mysql restart
```
</br>
Steps to reproduce to disable secure priv for data loading:

```mysql> select @@GLOBAL.secure_file_priv;```
Place files in the directory that appears

</br>

Steps to reproduce to avoid: ``` "Loading local data is disabled; this must be enabled on both the client and server sides"```:
```
SET GLOBAL local_infile=1;
quit
```


</br>

Steps to reproduce to avoid: ```LOAD DATA LOCAL INFILE file request rejected due to restrictions on access.```:
```
sudo chmod 755 /var/lib/mysql-files/
```

</br>

Steps to reproduce to avoid: ```ERROR 1265 (01000): Data truncated for column```
```
SHOW VARIABLES LIKE 'sql_mode';
```
If STRICT_TRANS_TABLES present then:
```
set sql_mode='';
```
