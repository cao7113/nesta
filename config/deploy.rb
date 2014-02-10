# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'nesta'
set :repo_url, File.expand_path("../../.git", __FILE__) #or set :repo_url, "git@shareup:nesta"

# Default branch is :master
#set :branch, :master #or ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, File.expand_path('~/apps/nesta')

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
#set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#set :linked_files, %w{config/database.yml}
#set :config_files, %w{database.yml.sample}

# Default value for linked_dirs is []
# TODO content
set :linked_dirs, %w{content bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/rbenv/versions/2.0.0-p353/bin:$PATH" }

set :rbenv_custom_path, '/opt/rbenv' #eg. /opt/rbenv
set :rbenv_ruby, '2.0.0-p353' #eg. '2.0.0-p353'

# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 0 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 0 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  # this:
  # http://www.capistranorb.com/documentation/getting-started/flow/
  # is worth reading for a quick overview of what tasks are called
  # and when for `cap stage deploy`
  
  # make sure we're deploying what we think we're deploying
  before :deploy, "deploy:check_revision"

  # only allow a deploy with passing tests to deployed
  # before :deploy, "deploy:run_tests"

  # compile assets locally then rsync
  # after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  #before :publishing, :compile_assets_locally
end
