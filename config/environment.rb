RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "pg"
  #config.gem "brazilian-rails", :version => '2.1.15'
  config.time_zone = 'UTC'
  config.gem "will_paginate", :require => 'will_paginate'

end
                         
require "#{RAILS_ROOT}/lib/fpdf.rb"