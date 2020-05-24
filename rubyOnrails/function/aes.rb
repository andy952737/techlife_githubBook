#加密測試
def password_get
    #user = User.find(1)
    $key = "0000000000000000"
    $iv = "0000000000000000"    
    code = params[:code]
    code_aes = aes_encrypt(code) 
    code_aes_output = aes_decrypt(code_aes)
    user = User.find_by(phone: "0999123456",password_digest: 
    code_aes)
    #user.update(password_digest: code_aes)
    #render json: [code_aes,code_aes_output]
    render json: user.to_json(only: [:id, :phone, :password_digest, 
    :username])
end 

#AES加密
def aes_encrypt(data)
    cipher = OpenSSL::Cipher::AES128.new(:CBC)
    cipher.encrypt
    cipher.key = $key
    cipher.iv = $iv
    encrypted = cipher.update(data) + cipher.final
    encrypted_base64 = Base64.encode64(encrypted)
    return encrypted_base64
end

#AES解密
def aes_decrypt(encrypted_base64)
    encrypted = Base64.decode64(encrypted_base64)
    decipher = OpenSSL::Cipher::AES128.new(:CBC)
    decipher.decrypt
    decipher.key = $key
    decipher.iv = $iv
    data = decipher.update(encrypted) + decipher.final
    return data
end