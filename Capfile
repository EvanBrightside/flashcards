require "capistrano/setup"

require "capistrano/deploy"
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/rails"
require "capistrano/puma"
require 'dotenv'
require "capistrano/scm/git"

install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
