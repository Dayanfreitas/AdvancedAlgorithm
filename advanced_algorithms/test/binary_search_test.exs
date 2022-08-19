defmodule BinarySearchTest do
  use ExUnit.Case
  doctest BinarySearch

  test "binary search found in the 3 index" do
    list = ["ANDRE", "BRUNO", "CAIO", "DAYAN"]
    key = "DAYAN"
    assert BinarySearch.search(key, list, 0, length(list)) == {:ok, 3}
  end

  test "binary search found in the 0 index" do
    list = ["ANDRE", "BRUNO", "CAIO", "DAYAN"]
    key = "ANDRE"
    assert BinarySearch.search(key, list, 0, length(list)) == {:ok, 0}
  end

  test "binary search not found" do
    list = ["ANDRE", "BRUNO", "CAIO", "DAYAN"]
    key = "FELIPE"
    assert BinarySearch.search(key, list, 0, length(list)) == {:error, -1}
  end
end
