#source 'http://rubygems.org'
source "http://ruby.taobao.org"

gemspec

gem 'rack'
gem 'sinatra'
gem 'haml'
#gem 'redcarpet'
gem 'rdiscount'
gem 'sass'

group :test do
  gem 'rspec'
end

group :development do
  gem 'pry'
  #gem 'pry-debugger'
end

# config for capistrano puma
gem 'puma'
group :development do
  gem 'capup', github: 'cao7113/capup'
  #gem 'capup', path: File.expand_path("~/dev/capup")
  gem 'capistrano3-puma', github: 'cao7113/capistrano-puma'
  #gem 'capistrano3-puma', path: File.expand_path("~/dev/capistrano-puma")
end
