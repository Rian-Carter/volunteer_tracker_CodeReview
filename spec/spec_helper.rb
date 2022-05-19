require('rspec')
require('pg')
require('project')
require('volunteer')
require('pry')
require('./db_access.rb')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM projects *;")
    DB.exec("DELETE FROM volunteers *;")
  end
end