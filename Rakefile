# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'

begin
  # gem install mislav-hanna
  require 'hanna/rdoctask'
rescue LoadError
  require 'rake/rdoctask'
end

if RAILS_ENV == 'development'
  begin
    # gem install nono-railroad
    require 'railroad/tasks/diagrams'
  rescue LoadError
  end
end

require 'tasks/rails'
