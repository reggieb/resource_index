require "resource_index/engine"
require "resource_index/search"
require "resource_index/search_engine"
require_relative "resource_index/railtie" if defined?(Rails) # needed for rake tasks to be loaded into host app

module ResourceIndex
end
