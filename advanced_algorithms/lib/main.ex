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

    BinarySearch.search("DAYAN", all_names, 0, length(all_names))
    |> IO.inspect

    BinarySearch.search("DAYAN", male_name_list, 0, length(male_name_list))
    |> IO.inspect

    BinarySearch.search("JOSE", female_name_list, 0, length(female_name_list))
    |> IO.inspect
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
    |> CSV.decode()
    |> Enum.map(fn x -> read_name(x) end)
    |> List.delete_at(0)
  end

  def read_name({_, arr}) do
    arr
    |> List.first()
  end
end
