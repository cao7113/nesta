# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'nesta'
set :repo_url, File.expand_path("../../.git", __FILE__) #or set :repo_url, "git@shareup:nesta"
set :content_path, "/data/udoc"

# Default branch is :master
#set :branch, :master
#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/apps/nesta'

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
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system content}

# Default value for default_env is {}
# set :default_env, { path: "/opt/rbenv/versions/2.0.0-p353/bin:$PATH" }

#set :rbenv_custom_path, '/opt/rbenv' #eg. /opt/rbenv
#set :rbenv_ruby, '2.0.0-p353' #eg. '2.0.0-p353'
set :bundle_flags, '--deployment' #' --quiet'

# Default value for keep_releases is 5
set :keep_releases, 3

desc "Setup doc"
task :setup do
  on roles(:app) do |role|
    if test "[ -d #{shared_path}/content ]"
      sudo "rm -r #{shared_path}/content"
    end
    sudo "ln -sb #{fetch(:content_path)} #{shared_path}/content"
  end
end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke "uwsgi:emperor:add"
    #on roles(:app), in: :sequence, wait: 1 do
    #  # Your restart mechanism here, for example:
    #  # execute :touch, release_path.join('tmp/restart.txt')
    #end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 1 do
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
