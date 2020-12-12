# mysql 


# linux install
```
sudo apt-get install mysql-server  
sudo service mysql start
```

# linux mysql 移除
```
sudo apt-get remove --purge mysql-server mysql-client mysql-common
sudo apt-get autoremove
sudo apt-get autoclean
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/mysql
```


# mac install
```
...
```


# 進階
```
預設 root
debian-sys-maint

mysqld_safe --skip-grant-tables
```