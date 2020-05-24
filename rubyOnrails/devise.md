# Rails Devise 使用者認證

# Gem
```
gem ‘devise’
rails generate devise:install

rails generate devise user
rails generate devise:views users
rails generate devise:controllers user

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2’
```

# Devise操作
```
if user_signed_in?
current_user.x

config.secret_key = '{key}'

Devise Controoler 
xxx < Devise::RegistrationsController
```
# Mail應用
```
/config/environments/{dev}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: "http://localhost:3000" }
  config.action_mailer.smtp_settings = {
    :address => "smtp.mail.com",   
    :port => "587",
    :domain => "mail.com",
    :authentication => "plain",
    :user_name => "mail@123.com.cc", #  設定 Gmail帳號
    :password => "password",      # Gmail『設定』密碼  wgvqyvbygtcurtqb
    :enable_starttls_auto => true
```

# Link
<https://qiita.com/vc7/items/054be41be75b41813822>

