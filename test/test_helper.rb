#$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bundler"
Bundler.require
require 'api'

DatabaseCleaner.strategy = :truncation

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/test.sqlite3"
)

class MiniTest::Spec

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
