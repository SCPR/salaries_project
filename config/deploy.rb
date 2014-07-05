require "bundler/capistrano"

config = YAML.load_file("config/deploy_config.yml")

set :application, "salaries_project"
set :scm, :git
set :repository,  "git@github.com:SCPR/salaries_project.git"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :deploy_to, config["deploy_to"]

set :user, config["user"]
set :use_sudo, false
set :group_writable, false

# --------------
# Variables
set :branch, "master"
set :rails_env, "production"

# --------------
# Roles
role :app, config["server"]
role :web, config["server"]

before "deploy:symlink", "deploy:symlink_config"
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do end
  task :stop do end
  task :migrate do end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_config do
    %w{ database.yml app_config.yml }.each do |file|
      run "ln -nfs #{shared_path}/config/#{file} #{release_path}/config/#{file}"
    end
  end
end
