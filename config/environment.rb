RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "sqlite3-ruby", :lib => "sqlite3"
  #config.gem "brazilian-rails", :version => '2.1.15'
  config.time_zone = 'UTC'

end
