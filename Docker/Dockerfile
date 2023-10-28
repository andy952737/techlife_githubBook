# Docker容器化rails7.0.8, ruby2.7.2
# Docker版本: Docker版本(Docker version 24.0.6, build ed223bc)

FROM ruby:2.7.2
MAINTAINER andy <xxx@xxx.xx>
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs vim postgis imagemagick 
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler:2.4.13
RUN gem install rake:13.0.6
RUN gem install sqlite3
RUN gem install nokogiri --platform=ruby
RUN apt-get update && apt-get install -y libsqlite3-dev
RUN bundle config set force_ruby_platform true
RUN bundle install

ENV SECRET_KEY_BASE=secret_key_base
# secret_key_base => ruby -rsecurerandom -e 'puts SecureRandom.hex(64)' 
# 補充：這個key可以寫在環境變數檔案裡, 取變數較安全處理.

COPY . /app
CMD rake db:migrate assets:precompile && puma -C config/puma.rb

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES yes
ENV RAILS_LOG_TO_STDOUT yes

CMD ["bundle", "exec", "rails", "server"]
