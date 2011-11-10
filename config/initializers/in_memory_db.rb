#Initialize testing db in memory
# TODO make this better code, and less hack-y

def in_memory_database?
  Rails.env == "test" and 
    ActiveRecord::Base.connection.class == ActiveRecord::ConnectionAdapters::SQLiteAdapter || 
    ActiveRecord::Base.connection.class == ActiveRecord::ConnectionAdapters::SQLite3Adapter and
    Rails.configuration.database_configuration['test']['database'] == ':memory:'
end
      
if in_memory_database? and !(defined?(Spork) and Spork.using_spork?)
  warn "creating sqlite in memory database"
  $stdout=$stderr
  load "#{Rails.root}/db/schema.rb"
  $stdout=STDOUT
end