require 'test_helper'

class NumberTest < ActiveSupport::TestCase
  test "should record only unique data" do
     t = Number.new(:or => '10', :bin => 'test', :rev => 'record', :res => '100')
     t.save
     n = Number.new(:or => '10', :bin => 'test', :rev => 'record', :res => '100')
     assert !n.save
   end
end
