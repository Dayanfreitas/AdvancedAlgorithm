defmodule Main do
  use Application

  def start(_, _) do
    run()
    {:ok, self()}
  end

  def run() do
    {:ok, arr} = load_data()
    
    {_, all_names} = List.keyfind(arr, :all_names, 0)
    {_, female_name_list} = List.keyfind(arr, :female_name_list, 0)
    {_, male_name_list} = List.keyfind(arr, :male_name_list, 0)

    {:ok, index} = BinarySearch.search("DAYAN", all_names, 0, length(all_names))
    |> IO.inspect
 
    Enum.at(all_names, index)
    |> IO.inspect

    BinarySearch.search("DAYAN", male_name_list, 0, length(male_name_list))
    |> IO.inspect

    BinarySearch.search("MARIA", female_name_list, 0, length(female_name_list))
    |> IO.inspect

    {:ok, exists} = name_exists_in_both_list(male_name_list, female_name_list, "JOSE")
    IO.puts("exists in both lists => #{exists}")
  end

  def load_data do
    IO.puts("Loading names...")
    female_name_list = load_csv_name("../../data/ibge-fem-10000.csv")
    male_name_list = load_csv_name("../../data/ibge-mas-10000.csv")

    all_names = Enum.concat(male_name_list, female_name_list)

    female_name_list = Enum.sort(female_name_list)
    male_name_list = Enum.sort(male_name_list)
    all_names = Enum.sort(all_names)

    {:ok,
     all_names: all_names, female_name_list: female_name_list, male_name_list: male_name_list}
  end

  def load_csv_name(path) do
    path
    |> parse_name_for_array
  end

  def parse_name_for_array(path) do
    path
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(fn x -> read_name(x) end)
  end

  def read_name({_, tuple}) do
    tuple["nome"]
  end

  def name_exists_in_both_list(list_a, list_b, name) do
    {:ok, index_a} = BinarySearch.search(name, list_a, 0, length(list_a))
    {:ok, index_b} = BinarySearch.search(name, list_b, 0, length(list_b))

    {:ok, index_a != -1 && index_b != -1}
  end
end
