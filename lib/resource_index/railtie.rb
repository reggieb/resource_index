require 'resource_index'
require 'rails'
module ResourceIndex
  class Railtie < Rails::Railtie
    # makes resource index rake tasks available to host app
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'../tasks/*.rake')].each { |f| load f }
    end 
    
  end
end
