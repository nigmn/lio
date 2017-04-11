require 'E:\lab\7\1\dop6.rb'
require 'minitest/autorun'
class Testlab < Minitest::Test
  def setup
	str = 'hrhaj eha 6'
    @f = File.new
	@f.write(str)
	@f.close
  end
  def test
    assert_equal(poi,1)
  end
end
