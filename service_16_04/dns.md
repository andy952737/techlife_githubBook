# DNS設定篇

# Apache VirtualHost設定
> /etc/apache2/sites-available/example.com.conf
``` 
 <VirtualHost *:80>
      RailsEnv development
      ServerName 21days.tw
      ServerAlias 21days.tw
      # !!! Be sure to point DocumentRoot to 'public'!
      DocumentRoot /home/chang/www/days/public
      Alias /.well-known/acme-challenge/ /var/www/letsencrypt/
      <Directory /home/chang/www/days/public>
         # This relaxes Apache security settings.
         AllowOverride all
         # MultiViews must be turned off.
         Options -MultiViews 
      </Directory>
   </VirtualHost>

<VirtualHost *:443>
      #Protocols h2 http/1.1
      #RailsEnv production
      RailsEnv development
      ServerName 21days.tw:443
      ServerAlias 21days.tw:443
      # !!! Be sure to point DocumentRoot to 'public'!
      DocumentRoot /home/chang/www/days/public

      SSLEngine on
      SSLOptions +StrictRequire
      #SSLCertificateFile /etc/letsencrypt.sh/certs/www.playplus.com.tw/cert-1469601016.pem
      SSLCertificateFile /etc/letsencrypt.sh/certs/21days.tw/fullchain-1469603012.pem
      SSLCertificateChainFile /etc/letsencrypt.sh/certs/21days.tw/chain-1469603012.pem
      SSLCertificateKeyFile /etc/letsencrypt.sh/certs/21days.tw/privkey-1469603012.pem
      #SSLCertificateFile /etc/apache2/sslkey/18024afd2498c395.crt
      #SSLCertificateKeyFile /etc/apache2/sslkey/modishock.key
      #SSLCertificateChainFile /etc/apache2/sslkey/modishock.pem
      <Directory /home/chang/www/days/public>
       # This relaxes Apache security settings.
         AllowOverride all
         # MultiViews must be turned off.
         Options -MultiViews
         #ExpiresActive On
      </Directory>
</VirtualHost>
```

# Nginx 設定
> /etc/nginx/sites-available/example.com.conf 
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

# Godaddy
- Keyword: name, value -> server-ip-addr