## 官方版本 linux ubuntu 20.04, rvm for ruby 3.0.0, Rails 7.0.4.3

# Mac book: 

```
# local端(自己的電腦或筆電) for Mac book M1 (ARM)
# m1 => 前面請加 arch -x86_64 參數
arch -x86_64 rvm install 3.1.2

# old (暫時不用理)
# rvm install 2.3.3 --with-openssl-dir=`brew --prefix openssl` 
```

# adduser: 

(server剛建起來用root連進去第一件事，設定完登出，用使用者登入)

```
# step0 初始設定使用者
adduser {username}
vim authorized_keys 

# user name: deploy => /etc/sudoers
deploy  ALL=(ALL:ALL) ALL

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication no
service sshd restart
```

```
sudo apt update
sudo apt list --upgradable
sudo apt-get upgrade

# node & npm & yarn
sudo apt install -y nodejs
sudo apt install npm 
sudo apt install curl
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

# install ruby on rails 相關工具
sudo apt install curl g++ gcc autoconf automake bison libaio1 libncurses5 libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev
```

Ruby for RVM install：

```markdown
# for ubuntu 20.04
sudo apt update
gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable or curl -sSL https://get.rvm.io | bash
curl -sSL https://get.rvm.io | bash
source ~/.rvm/scripts/rvm
rvm list known
rvm install ruby-3.0.0

# for old project
rvm install ruby-2.3.3
rvm install ruby-2.7.2 
# project 要記得 bundle update 再推

# 預設ruby版本
rvm use 3.2.2 --default
rvm use 3.0.0 --default
rvm use 2.7.2 --default

gem install rails

# if ubuntu22.04 run
gem update --system 3.4.20
```

# Installing NGINX & Passenger
```

# for nginx passenger
sudo apt-get install -y dirmngr gnupg

# for ubuntu20.04
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger focal main > /etc/apt/sources.list.d/passenger.list'

# for ubuntu22.04 (比對用)
curl https://oss-binaries.phusionpassenger.com/auto-software-signing-gpg-key.txt | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/phusion.gpg >/dev/null
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger jammy main > /etc/apt/sources.list.d/passenger.list'

sudo apt-get update
sudo apt install -y libnginx-mod-http-passenger
sudo ls /etc/nginx/conf.d/mod-http-passenger.conf
sudo service nginx restart
sudo /usr/bin/passenger-config validate-install
sudo /usr/sbin/passenger-memory-stats

sudo apt install nginx-core
sudo apt install nginx-extras
sudo apt install nginx-full
sudo apt install nginx-light
sudo apt install passenger
passenger-config validate-install

passenger-install-nginx-module

sudo apt install libcurl4-openssl-dev 
or
sudo apt install libcurl4-gnutls-dev

# p.s.
export ORIG_PATH="$PATH"
  rvmsudo -E /bin/bash
  export PATH="$ORIG_PATH"
  /home/andy/.rvm/gems/ruby-3.2.2/wrappers/ruby /usr/bin/passenger-install-nginx-module

# /home/andy/test1

# capistrano 
push github
cap production deploy

# step 3 nginx config 
server {  
    listen 80;

    rails_env production; 

    server_name ip-addr;

    location ~ /.well-known {
         allow all;
         # root /opt/nginx/html;
    }
		
    root /home/andy/test1/;
		
    passenger_enabled on;
		
}
```


