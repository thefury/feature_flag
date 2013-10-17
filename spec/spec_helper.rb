require 'rubygems'
require 'feature_flag'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:')

ActiveRecord::Schema.define do
  self.verbose = false
  
  create_table 'feature_flag_toggles', force: true do |t|
    t.string :name
    t.boolean :active
  end
end
