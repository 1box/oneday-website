default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :repository,  "git@oneboxapp.com:oneboxapp.git"   # Your clone URL
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :scm_user, "yutianhang"
set :user, "kimi"   # The server's user for deploys
set :password, "333"
# cap assumes you want to do things with sudo on remote servers, we don't and infact
# intentionally can't, no problem:
set :use_sudo, false
set :scm_passphrase, "333"  # The deploy user's password

set :ssh_options, { :forward_agent => true }
set :branch, "master"
set :deploy_via, :remote_cache
# set :git_shallow_clone, 1   # Warned! shallow clone won't work well with the set :branch option
# set :git_enable_submodules, 1

set :application, "one_day"
set :deploy_to, "/home/kimi/workspaces/oneboxapp/website/#{application}"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# set :domain, 'kimi@oneboxapp.com'
# 
# role :web, domain                   # Your HTTP server, Apache/etc
# role :app, domain                   # This may be the same as your `Web` server
# role :db,  domain, :primary => true # This is where Rails migrations will run
# role :db,  domain

# if you want to clean up old releases on each deploy uncomment this:
set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"

server "oneboxapp.com", :app, :web, :db, :primary => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
