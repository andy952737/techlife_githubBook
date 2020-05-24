Linux ubuntu install
> Google Cloud Platform ubuntu 18.04~ nginx passenger ruby rails
- gcloud compute ssh {名稱} --zone {地區}
- ssh-keygen -R 127.0.0.1
- sudo su
- adduser {username}
- /etc/sudsers
- /etc/ssh/sshd_config
- service sshd restart

# Install Ruby Rails & NodeJS
- apt upgrade
- apt update
- apt install -y curl gnupg build-essential
- apt install gnupg2 or sudo apt-get install gnupg2 -y
- apt install curl
- \curl -sSL https://get.rvm.io | bash
- source /home/{username}/.rvm/scripts/rvm
- source ~/.rvm/scripts/rvm
- rvm requirements
- rvm install 2.5.3 
- ruby -v 
- gem install bundler
- apt install -y nodejs
- sudo ln -sf /usr/bin/nodejs /usr/local/bin/node
- curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
- gem install rails -v 5.1.6~
- apt install rbenv

# Install Passenger packages & Nginx 
- apt install -y dirmngr gnupg
- apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
- sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
- apt update
- apt install -y libnginx-mod-http-passenger
- Copy { Nginx modules-enabled code }
- sudo ls /etc/nginx/conf.d/mod-http-passenger.conf
- service nginx restart
- sudo /usr/bin/passenger-config validate-install
- sudo /usr/sbin/passenger-memory-stats
- apt install nginx-core
- apt install nginx-extras
- apt install nginx-full
- apt install nginx-light
- passenger-config validate-install 
- apt install nginx-core 

# Nginx modules-enabled code:
```
if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi

 // sudo /usr/bin/passenger-config validate-install
 * Checking whether this Phusion Passenger install is in PATH... ✓
 * Checking whether there are no other Phusion Passenger installations... ✓
```
# Nginx Server Rails:
```
server {
  
    #監聽 port 80 （ https request ）
    listen 80;
    # 443 ssl;

    rails_env development;

    server_name ip-addr;

    #SSL 憑證相關設定
    #ssl on; 
    #ssl_certificate      /etc/letsencrypt/live/dodeploy.tk/fullchain.pem;
    #ssl_certificate_key  /etc/letsencrypt/live/dodeploy.tk/privkey.pem;
          
    #註解3
    location ~ /.well-known {
         allow all;
         root /opt/nginx/html;  
    } 

    #提供靜態檔案的放置目錄
    root /home/{username}/www/{project}/public;
    
    #啟動 Passenger 
    passenger_enabled on;
} 
```
# postgreSQL linux ubuntu Install
``` 
apt install libpq-dev
gem install pg 
apt update || apt -y upgrade 
apt install postgresql postgresql-contrib​

sudo systemctl status postgresql.service

sudo apt install wget ca-certificates
 
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo apt install postgresql-10 pgadmin4
```