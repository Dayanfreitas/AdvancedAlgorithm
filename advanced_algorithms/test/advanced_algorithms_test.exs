defmodule AdvancedAlgorithmsTest do
  use ExUnit.Case
  doctest AdvancedAlgorithms

  test "function binary search" do
    assert AdvancedAlgorithms.binary_search == :ok
  end
end
