class Thing < ActiveRecord::Base
  attr_accessible :name, :role
  
  extend ResourceIndex::SearchEngine
  
end
