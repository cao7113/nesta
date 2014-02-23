require 'capistrano/setup' # Load DSL and Setup Up Stages
require 'capistrano/deploy' # Includes default deployment tasks

# Includes tasks from gems in your Gemfile, eg: capistrano-rbenv, capistrano-bundler, capistrano-rails
#require 'capistrano/rbenv' # https://github.com/capistrano/rbenv, other: rvm, chruby
require 'capistrano/bundler' # https://github.com/capistrano/bundler
#require 'capistrano/rails/assets' # https://github.com/capistrano/rails
#require 'capistrano/rails/migrations'

require 'capup/all'

require 'capistrano/uwsgi'
require 'capistrano/uwsgi/emperor'
require 'capistrano/uwsgi/nginx'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
#Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
