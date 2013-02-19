require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  def test_responds_to_required_class_methods
    class_methods_required = %w{all find}
    class_methods_required.each{|m| assert Thing.respond_to? m, "should respond to #{m}"}
  end
  
  def test_responds_to_required_instance_methods
    instance_methods_required = %w{attributes id}
    thing = Thing.new
    instance_methods_required.each{|m| assert thing.respond_to? m, "should respond to #{m}"}
  end
end
