set :application, 'flashcards'

set :repo_url, 'git@github.com:EvanBrightside/flashcards.git'

set :branch, 'master'

set :deploy_to, '/home/deploy/applications/flashcards'

set :log_level, :info

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

set :rbenv_type, :user
set :rbenv_ruby, '2.4.3'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_roles, :all

set :puma_init_active_record, true
