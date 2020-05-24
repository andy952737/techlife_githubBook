## RubyonRails Tech Coding Note      

# iOSX mac brew RVM ruby rails
> https://tingtinghsu.github.io/blog/articles/2019-01-24-rails_ruby_version_RVM
```
rvm install x.x.x
rvm use x.x.x --default
rvm -v
rvm install {安裝的元件}
rvm list know 
rvm instal ruby-x.x.x
gem list
gem install rails -v x.x.x.x
```

# Rails Code
```
rake secret
rails secret
rake assets:precompile

rake db:data:dump
rake db:schema:load
rake db:data:load
 
RAILS_ENV={production} bundle install
rails s -e {production}

rails g migration add_name_to_admin_user:type
```

# 常用好用Gem
```
gem 'active_model_serializers', '~> 0.10.0’

controller
include ActionController::Serialization

rails g serializer {model}

class ModelSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at
end 

gem 'whenever', require: false
wheneverize .
whenever - i
whenever - w
crontab -l 

gem ‘rmagick'  
include CarrierWave::RMagick 
version :thumb do
    process :resize_to_fit => [200, 200]
end
bytesToMegabytes = (bytes) ->
  return Math.round((b/1024/1024) * 100) / 100

bundle install
bundle update
rails c
rails s

rails new project_name
rails _6.0.1_ new project_name

rake log:clear
rake tmp:clear
rake db:drop
rake db:create
rake db:migrate
rake db:reset

rvm -v
rvm list
rvm list known
rvm x.x.x —default  

```

# Rails raise Error處理機制
```
raise "An error has occurred"
```

# Rails+AJAX架構寫法 
> 以public controller為例 
```
views:
public/
	index.html.erb
	show.html.erb
	create.js.erb
	destroy.js.erb
	update.js.erb
```

# Remark
<https://github.com/yamldb/yaml_db>