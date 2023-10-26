# MySQL  


# mac use Brew install
brew info mysql
brew install mysql mycli
brew install mysql@5.7 mycli

# 確認目前安裝的狀態
brew services list

brew services start mysql@5.7

# 登入
mycli -u root -h localhost

# 移除
brew services stop mysql@5.7
brew uninstall mysql@5.7
brew cleanup
sudo rm -rf /usr/local/var/mysql

# linux ubuntu install (MariaDB)
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
