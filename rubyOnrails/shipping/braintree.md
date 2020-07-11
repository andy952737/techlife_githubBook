# Braintree+paypal
```
1. 打開瀏覽器，它會先跟網頁伺服器要一組 token，這個伺服器在這裡就是我們的 Rails 專案。
2. 我們的網頁伺服器產生一組 token 給瀏覽器（或手機）。
3. 當在頁面上填完信用卡號以及有效日期後，按下送出，這時候會再跟 Braintree 伺服器要一組 nonce（隨機數）。
4. 瀏覽器取得這組 nonce 後會傳給我們的網頁伺服器，然後伺服器就會把所有相關資訊組合成一包資訊傳給 Braintree，進行刷卡。
```

# 設定
```
gem ‘braintree'

@client_token = Braintree::ClientToken.generate
```

# Model
```
aasm_state(string), product(integer), quantity(integer)
```

# Remark
<https://www.braintreepayments.com/>