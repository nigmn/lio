require 'E:\lab\7\2\pik.rb'
require 'minitest/autorun'
class TestProg < Minitest::Test # :nodoc:
  def setup
    @class1 = Chislo_p.new(364)
    @class2 = Strok_p.new(364, 'rjsr')
  end

  def test_1
    assert_equal(@class1.output, 3)
  end

  def test_2
    assert_equal(@class2.output, 4)
  end
end
