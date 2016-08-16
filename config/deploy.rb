# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'lipans'
set :repo_url, 'git@github.com:kaywiinee/lipans.git'

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :branch, :master

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_tag, "deploy-#{Time.now.strftime('%Y%m%d-%H%M-%S')}"

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :branch,      fetch(:branch, 'master')
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
# Default value for :scm is :git
# set :scm, :git
# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true
set :pty, false
# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
# set :linked_files, fetch(:linked_files, []).push()
# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :delayed_job_server_role, :delayed_job

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
    #invoke 'delayed_job:restart'
  end

  after :publishing, :restart

end
namespace :git do
  desc 'set release path'
  task :set_my_release_path do
    on release_roles :all do
      with fetch(:git_environmental_variables) do
        within repo_path do
          my_release_name = capture('date +"%Y%m%d%H%M%S"')
          my_release_path = release_path.parent.join(my_release_name)
          set :release_path, my_release_path
          strategy.update
        end
      end
    end
  end
end
