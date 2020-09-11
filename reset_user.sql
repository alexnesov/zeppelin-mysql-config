sudo mysql -u root -p
drop user 'root'@'localhost';
create user 'root'@'%' identified by 'your_password';
grant all privileges on *.* to 'root'@'%' with grant option;
flush privileges;
