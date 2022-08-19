defmodule BinarySearch do
  def search(key, list, left, right) do
    middle = trunc((left + right) / 2)
    
    {:ok, item} = Enum.fetch(list, middle)

    cond do
      left >= right ->
        {:error, -1}

      item == key ->
        {:ok, middle}

      true ->
        if item < key do
          search(key, list, middle + 1, right)
        else
          search(key, list, left, middle - 1)
        end
    end
  end
end
