 namespace :resource_index do
 
  desc "Populate a resource's index database: resource_index:populate resource=Thing"
  task :populate => :environment do
    class_name = ENV['resource']
    raise "You must enter a resource name" unless class_name
    unless /^[A-Z]\w+(::[A-Z]\w+)*$/ =~ class_name
      raise "The resource must be the name of a ruby class"
    end
    puts eval("#{class_name}.populate_search_engine")
  end
 
 end
