ENV["API_ENV"]  ||= "development"

require "bundler/gem_tasks"
require 'active_record'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
  t.libs << "test"
end


namespace :db do
  desc "creates the tables to work with"
  task :migrate do
    ActiveRecord::Base.establish_connection(
                          adapter: "sqlite3",
                          database: "db/#{ENV["API_ENV"]}.sqlite3"
    )
    ActiveRecord::Migrator.migrate(File.expand_path('../lib/api/migrations', __FILE__))
  end
end
task default: :test