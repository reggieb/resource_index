require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  
  def test_responds_to_required_class_methods
    class_methods_required = %w{all find first}
    class_methods_required.each{|m| assert Thing.respond_to? m, "should respond to #{m}"}
  end
  
  def test_responds_to_required_instance_methods
    instance_methods_required = %w{attributes id}
    thing = Thing.new
    instance_methods_required.each{|m| assert thing.respond_to? m, "should respond to #{m}"}
  end
  
  def test_get_first
    assert Thing.first, "should get a thing from database"
  end
  
  def test_search_engine
    assert_kind_of XapianFu::XapianDb, Thing.search_engine
    expected = Rails.root.to_s + "/db/resource_index/thing"
    assert_equal(expected, Thing.search_engine.dir)
  end
  
  def test_populate_search_engine
    Thing.populate_search_engine
    assert_equal(Thing.count, Thing.search_engine.size)
  end
  
  def test_search
    things = Thing.search('producer')
    producers = Thing.where("role LIKE '%PRODUCER%'")
    assert_equal(producers.length, things.length)
    assert_equal(producers.collect(&:id).sort, things.collect(&:id).sort)
  end
  
  def test_search_with_pagination
    thing_count = Thing.count
    [1, 5, 10, 15, 20, 30].each do |page_length|
      expected = page_length > thing_count ? thing_count : page_length
      assert_equal(expected, Thing.search(:all, :page => 1, :per_page => page_length).length)
    end
  end
end
