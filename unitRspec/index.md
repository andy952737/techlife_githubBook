# RSpec UnitTest v1.0

# Gem 
```
group :development, :test do
    #RSpec測試系列Gem
    gem 'rspec-rails', ">= 3.9.0"
    gem 'faker'
    gem 'capybara'
    gem 'guard-rspec'
    gem 'launchy'
    gem 'rails-controller-testing'
    gem 'shoulda-matchers'
end
 
group :test do
    gem 'faker'
    gem 'capybara'
    gem 'guard-rspec'
    gem ‘launchy'
    gem ‘fabrication'
end
```