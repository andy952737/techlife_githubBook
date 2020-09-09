## Rails Twilio 簡訊API

# Gem
```
gem 'twilio-ruby’
```

# Controller
```
message = "The coffee roast '#{@coffee_roast.roast_name}' was just added.”

TwilioTextMessenger.new(message).call
```

# app/service/twilio_text_messenger.rb
```
class TwilioTextMessenger
attr_reader :message

def initialize(message)
  @message = message
end

def call
  client = Twilio::REST::Client.new
  client.messages.create({
  from:   Rails.application.secrets.twilio_phone_number,
  #to: 'YOUR PERSONAL PHONE NUMBER GOES HERE',
  to: 'mobile_nmber',
    body: message
  })
  end
end
```

# config/initializers/twilio.rb
```
Twilio.configure do |config|
    config.account_sid = Rails.application.secrets.twilio_account_sid
    config.auth_token = Rails.application.secrets.twilio_auth_token
end
```

# config/secrets.yml 
```
twilio_account_sid: {account_sid_key}
twilio_auth_token: {auth_token_key}
twilio_phone_number: {phone_number} 
```

# Remark
<https://www.twilio.com/blog/2017/12/send-sms-ruby-rails-5-coffee.html>