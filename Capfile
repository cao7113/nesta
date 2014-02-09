require 'capistrano/setup' # Load DSL and Setup Up Stages
require 'capistrano/deploy' # Includes default deployment tasks

# Includes tasks from gems in your Gemfile, eg: capistrano-rbenv, capistrano-bundler, capistrano-rails
require 'capistrano/rbenv' # https://github.com/capistrano/rbenv, other: rvm, chruby
require 'capistrano/bundler' # https://github.com/capistrano/bundler
#require 'capistrano/rails/assets' # https://github.com/capistrano/rails
#require 'capistrano/rails/migrations'
require 'capup/all'

#use puma server TODO
require 'capistrano/puma'
require 'capistrano/puma/jungle' #if you need the jungle tasks
#require 'capistrano/puma/monit' #if you need the monit tasks
require 'capistrano/puma/nginx'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
#Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
