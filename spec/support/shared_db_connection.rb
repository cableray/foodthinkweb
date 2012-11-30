class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end

  def self.establish_connection(*spec)
    super(*spec) unless @@shared_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread. Also helps spork forks using an in-memory db.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
