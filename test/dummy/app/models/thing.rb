class Thing < ActiveRecord::Base
  attr_accessible :name, :role
  
  def self.search_engine
    @search_engine ||= ResourceIndex::Search.engine_for(self)
  end
  
  def self.populate_search_engine
    @search_engine = nil
    engine = ResourceIndex::Search.engine_for(self, :overwrite => true)
    all.each{|thing| engine << thing.attributes}
    engine.flush
  end
  
  def self.search(text)
    search_engine.search(text)
  end
  
end
