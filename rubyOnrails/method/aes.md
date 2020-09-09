```	
require 'digest/sha2'
require 'openssl'
require 'base64'

def base64(data)
    Base64.encode64(data).chomp
end

#商家提供Key Iv 
@hash_key = 'key金鑰'
@hash_iv = 'iv金鑰'      
 

#交易資料 
@MerchantOrderNo = "123456789"
@Amt = 500 
@PaymentType = "ATM" 
@ExpireDate = "2020-05-31"
@Version = '1.5' 

#AES加密
key = 'key金鑰'
iv  = 'iv金鑰'
cipher = OpenSSL::Cipher.new 'aes-256-cbc'
cipher.encrypt
cipher.key = cipher.random_key 
cipher.iv = cipher.random_iv
encrypted = cipher.update "#{@MerchantOrderNo}#{@Amt}#{@PaymentType}#{@ExpireDate}#{@hash_key}#{@hash_iv}"
encrypted <<cipher.final
encoded = Base64.encode64(encrypted).encode('utf-8') 
@TradeInfo = encoded  
#puts @TradeInfo 
   
#SHA256加密 
Length = 256
newaes = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
newaes.encrypt
newaes.key= Digest::SHA256.digest("foo") 
# puts Base64.encode64(newaes.update("a"*Length))
# puts Base64.encode64(newaes.update("a"*Length))
# puts Base64.encode64(newaes.final) 
# puts @TradeSha = Base64.encode64(newaes.update(@TradeInfo*Length)).upcase
```