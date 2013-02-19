$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "resource_index/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "resource_index"
  s.version     = ResourceIndex::VERSION
  s.authors     = ["Rob Nichols"]
  s.email       = ["rob@undervale.co.uk"]
  s.homepage    = "https://github.com/reggieb/resource_index"
  s.summary     = "Provides client side indexing for service resources."
  s.description = "Uses Xapian index search to speed up searching ActiveResource objects and reduce calls to backend service"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rails"
  s.add_development_dependency "sqlite3"
  
  s.add_dependency 'xapian-ruby'
  s.add_dependency 'xapian-fu'
end
