require "bundler/capistrano"

set :application, "salaries_project"
set :scm, :git
set :repository,  "git@github.com:SCPR/salaries_project.git"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :deploy_to, "/web/archive/apps/salaries"

set :user, "archive"
set :use_sudo, false
set :group_writable, false

# --------------
# Variables
set :branch, "master"
set :rails_env, :production

# --------------
# Roles
role :app, "media.scpr.org"
role :web, "media.scpr.org"

# Setup staging
task :staging do
  roles.clear
  role :app, "scprdev.org"
  role :web, "scprdev.org"
end

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do end
  task :stop do end
  task :migrate do end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
