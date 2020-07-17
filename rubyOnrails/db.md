# Database

# Postgresql
```
//Mac
brew install postgresql

//Linux ubuntu
sudo apt install postgresql postgresql-contrib
systemctl status postgresql.service

psql
sudo -u postgres psql
psql -h localhost -U user db_name

\q
\l
\c {database_name}
\d
\di
\d {表名}
\du

create database <資料庫名稱>;
create role <管理員名稱>;
create user <管理員名稱>;
drop role <管理員名稱>;
drop user <管理員名稱>;
create table <表名> (<欄名><型名>,...);
select <欄名> from <表名>;
drop table <表名>;
alter table <表名> rename<舊欄名> to<新欄名> ;
delete from <表名>;
INSERT INTO <表格名> (<欄位1>, <欄位2>, ...) VALUES (<值1>, <值2>, ...);

pg_dump db_name > xxx.sql
psql db_name < xxx.sql

sudo service postgresql start
sudo service postgresql restart
sudo service postgresql stop

createuser  -P test         
createdb [資料庫名稱]
psql -c "grant all privileges on database [資料庫名稱] to [使用者名稱];”
createdb -Otest -Eutf8 test_db
psql {database}
GRANT ALL PRIVILEGES ON test TO test;
\q
psql -U p_andy test_db -h localhost -W
```

# MySQL
``` 
//Mac
brew install mysql

//Linux ubuntu
sudo apt install mysql-server

//如果沒有 mysql.database請輸入這個
mysqld_safe --skip-grant-tables 

sudo service mysql start
sudo service mysql restart
sudo service mysql stop
sudo /etc/init.d/mysql start
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql restart
sudo netstat -tap | grep mysql
show binary logs;
flush privileges;
create database demo_db;
drop database demo_db; 
show databases;
use demo_db;  
set global wait_timeout=180;
set global interactive_timeout=180;
show variables like '%timeout%';
show global variables like 'wait_timeout';
show global variables like 'interactive_timeout’;
mysqldump -u [username] -p [mydatabase] > /home/[myuser]/{database-dump}.sql
mysql -h [localhost] -u [username] -p [mydatabase] < {database-dump}.sql
mysql -u root -p demo_db < /home/user/db_data/demo_db.sql
```

# ubuntu 18.04安裝需參考
> sudo vim /etc/mysql/debian.cnf
<https://blog.csdn.net/qq_30505673/article/details/82495437>
``` 
root => debian-sys-maint

```

# MySQL Join on PHP demo
```
/* 練習 MYSQL JOIN */
$sql="SELECT category.title,product.title FROM category, product WHERE category.id = product.category_id ";
$rs=$PDOLink->query($sql);
$rs->setFetchMode(PDO::FETCH_ASSOC);  

while ($row=$rs->fetch()) {

    echo $row[title];

}

SELECT SUM(PayValue) FROM `EZCard_record` WHERE 1 and YEAR(Time) = 2018 and MONTH(Time) = 9
SELECT DISTINCT MONTH(Time),SUM(PayValue) FROM `EZCard_record` where 1 and MONTH(Time) = 9
SELECT SUM(PayValue) FROM `EZCard_record` where 1 and Sort = 'Storet'
```

# Remark
<https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04>
<https://blog.gtwang.org/linux/how-to-install-and-use-postgresql-ubuntu-18-04/>