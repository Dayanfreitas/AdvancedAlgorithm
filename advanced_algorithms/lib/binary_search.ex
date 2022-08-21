defmodule BinarySearch do
  def search(key, list, left, right) do
    middle = trunc((left + right) / 2)
    
    {_ok, item} = get_middle(Enum.fetch(list, middle))

    cond do
      item == key ->
        {:ok, middle}
      left >= right ->
        {:error, -1}
      true ->
        if item < key do
          search(key, list, middle + 1, right)
        else
          search(key, list, left, middle - 1)
        end
    end
  end
  
  defp get_middle(:error) do {:ok, nil} end
  defp get_middle({:ok, item}) do {:ok , item} end
end
