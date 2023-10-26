
# 這用不到可以刪除
rm -rf test

# 安裝 Gem
gem "rspec-rails", "6.0.1"

bundle install

rails g rspec:install

# run
bundle exec rspe spec/...
bin/exec rspec 
