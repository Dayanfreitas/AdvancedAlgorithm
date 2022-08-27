require 'test/unit'
require_relative './../../ultis/vetor.rb'

class VetorTest < Test::Unit::TestCase

  def setup
    @index_0 = 8
    @index_1 = 5
    @vetor = Vetor.new([@index_0, @index_1])
  end

  def test_init
    new_vetor = Vetor.new(@vetor)
    new_vetor.swap!(0, 1)
    
    assert_equal [@index_1, @index_0], new_vetor
  end
end
