#RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  #config.gem "brazilian-rails", :version => '2.1.15'
  config.time_zone = 'Brasilia'
  config.gem "will_paginate", :require => 'will_paginate'
  config.gem "liquid"

end
                         
require "#{RAILS_ROOT}/lib/fpdf.rb"

