require 'test/unit'
require_relative './../../ultis/vetor.rb'

class VetorTest < Test::Unit::TestCase

  def setup
    @index_0 = 8
    @index_1 = 5
    @vetor = Vetor.new([@index_0, @index_1])
  end

  def test_init_vetor
    new_vetor = Vetor.new(@vetor)
    assert_equal [@index_0, @index_1], new_vetor
  end

  def test_swap
    new_vetor = Vetor.new(@vetor)
    new_vetor.swap!(0, 1)
    
    assert_equal [@index_1, @index_0], new_vetor
  end

  def test_total_swap
    new_vetor = Vetor.new(@vetor)
    new_vetor.swap!(0, 1)
    assert_equal 1, new_vetor.total_swaps
  end

  def test_is_bigger
    new_vetor = Vetor.new(@vetor)
    assert new_vetor.is_bigger?(0, 1), "é maior"
  end
  
  def test_is_not_bigger
    new_vetor = Vetor.new(@vetor)
    new_vetor.swap!(0, 1)
    assert_false new_vetor.is_bigger?(0, 1), "não é maior"
  end
end
