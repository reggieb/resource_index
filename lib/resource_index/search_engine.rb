
module ResourceIndex
  module SearchEngine
    def search_engine
      @search_engine ||= ResourceIndex::Search.engine_for(self)
    end

    def populate_search_engine
      @search_engine = nil
      engine = ResourceIndex::Search.engine_for(self, :overwrite => true)
      all.each{|thing| engine << thing.attributes}
      engine.flush
      "#{self.to_s} search index populated with #{engine.size} entries."
    end

    def search(text)
      search_engine.search(text)
    end 
  end
end
