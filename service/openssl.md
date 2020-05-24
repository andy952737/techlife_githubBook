# DNS openssl

# Step1 install ssl
```
sudo apt-get install openssl
```

# Step2 ufw open
```
sudo ufw default allow
sudo ufw allow 443
sudo ufw allow http
sudo ufw allow https
sudo ufw deny ssh
```
 
# use certbot + Let’s Enctypt openssl
```
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot # 載入 certbot 的 ppa
sudo apt-get update # 更新 apt-get
sudo apt-get install python-certbot-nginx # 安裝 python 的 certbot for nginx

//建立憑證(需先有DNS網域名稱)
sudo certbot --nginx -d hellojcc.tw -d www.hellojcc.tw

sudo certbot renew --dry-run
sudo certbot certificates
```

# nginx ssl 設定 
```
server {
# ... other configs

# SSL setting
listen 443 ssl;

# set crt and key
ssl_certificate /etc/letsencrypt/live/hellojcc.tw/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/hellojcc.tw/privkey.pem;
# include 基本的 ssl 設定
include /etc/letsencrypt/options-ssl-nginx.conf;
# certbot 也會產生一把 Diffie-Hellman 密鑰
ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

# ... other configs
}
```

# 可參考 
```
# 確認 python 是 v3 以上
python --version
# 如果還是 v2 輸入指令更新
update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
# 更新 python3-acme
apt update && apt install --only-upgrade python3-acme
```
