# Linux Apache rails install
> 慣用版本: ubuntu 18.04 rails 4.2.5, 5.0.0, 5.2.2~   

# Apache 
```
To install Curl development headers with SSL support: apt-get install libcurl4-openssl-dev
To install Apache 2:   Please install it with apt-get install apache2-mpm-worker
To install Apache 2 development headers:   Please install it with apt-get install apache2-threaded-dev
To install Apache Portable Runtime (APR) development headers:   Please install it with apt-get install libapr1-dev
To install Apache Portable Runtime Utility (APU) development headers:   Please install it with apt-get install libaprutil1-dev 

//取得主機憑證
wget --no-check-certificate https://raw.github.com/joshfng/railsready/master/railsready.sh && bash railsready.sh

gem install passenger
gem install rack -v 1.5.2
passenger-install-apache2-module
aptitude update

//如果欠缺套件可參考
apt-get install libcurl4-openssl-dev apache2-threaded-dev libapr1-dev libaprutil1-dev

passenger-install-apache2-module
Include /etc/phpmyadmin/apache.conf
sudo nano /etc/apache2/apache2.conf
LoadModule passenger_module /home/andy/.rvm/gems/ruby-2.4.1/gems/passenger-5.1.8/buildout/apache2/mod_passenger.so
   <IfModule mod_passenger.c>
     PassengerRoot /home/andy/.rvm/gems/ruby-2.4.1/gems/passenger-5.1.8
     PassengerDefaultRuby /home/andy/.rvm/gems/ruby-2.4.1/wrappers/ruby
   </IfModule>

sudo apt-get install postfix 
postfix test => sendmail “email"
 
sudo aptitude install mysql-server
sudo apt-get install phpmyadmin
```