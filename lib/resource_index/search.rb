module ResourceIndex
  require 'xapian-fu'
  include XapianFu
  
  class Search < XapianDb
    
    def self.engine_for(klass, args = {})
      instance = klass.first
      config = {
        :dir => klass.to_s.downcase,
        :store => instance.attributes.keys,
        :create => true
      }
      config.merge! args
      engine(config)
    end
    
    def self.engine(args = {})
      dir = args.fetch(:dir, default_database_folder)
      path = File.expand_path(dir, root)
      create_root
      create_folder(path)
      args[:dir] = path
      new(args)  
    end
    
    # If used within a rails app, Xapian databases will be created at /db/resource_index/
    # Otherwise, a root location needs to be defined for the databases
    def self.root
      @root ||= get_root
    end
    
    def self.root=(path)
      @root = path
    end
    
    private
    def self.get_root
      if defined? Rails
        File.expand_path('db/resource_index', Rails.root)
      else
        raise "Path to Xapian database must be defined" unless @root
        @root
      end
    end
    
    def self.default_database_folder
      'search'
    end
    
    def self.create_root
      create_folder(root)
    end
    
    def self.create_folder(path)
      Dir.mkdir(path, 0700) unless Dir.exists?(path)
    end
  end
  
  
end
