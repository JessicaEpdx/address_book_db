require('rspec')
require('address')
require('contact')
require('phone')
require('email')
require('pg')

DB = PG.connect({:dbname => 'address_book_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM contact *;")
  end
end
