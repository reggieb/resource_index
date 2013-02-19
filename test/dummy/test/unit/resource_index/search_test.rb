require 'test_helper'

module ResourceIndex
  class SearchTest < ActiveSupport::TestCase
    def teardown
      Search.root = nil
    end
    
    def test_engine
      assert_kind_of XapianFu::XapianDb, Search.engine
    end
    
    def test_default_dir
      expected = Rails.root.to_s + "/db/resource_index/search"
      assert_equal(expected, Search.engine.dir)
    end
    
    def test_root
      expected = Rails.root.to_s + "/db/resource_index"
      assert_equal(expected, Search.root)
    end
    
    def test_alternative_root
      root = "~/home_database_folder"
      Search.root = root
      assert_equal(root, Search.root)
    end
    
    def test_engine_for
      assert_kind_of XapianFu::XapianDb, thing_engine
    end
    
    def test_engine_for_dir
      expected = Rails.root.to_s + "/db/resource_index/thing"
      assert_equal(expected, thing_engine.dir)
    end
    
    def test_engine_for_field
      expected = %w{id name role created_at updated_at}
      assert_equal(expected.sort, thing_engine.store_values.sort)
    end
    
    def thing_engine
      @thing_engine ||= Search.engine_for(Thing)
    end
    
  end
end
