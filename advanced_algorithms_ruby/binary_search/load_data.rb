module Data
  def self.load_names
    file_fem = File.open("../../data/ibge-fem-10000.csv")
    file_mas = File.open("../../data/ibge-mas-10000.csv")
    
    csv_file_fem = CSV.read(file_fem)
    csv_file_mas = CSV.read(file_mas)
    
    names_mas = []
    names_fem = []
    all_names = []
  
    
    csv_file_mas.each_with_index { |line, index|
      next if index == 0
      names_mas << line[0]
    }
  
    csv_file_fem.each_with_index { |line, index|
      next if index == 0
      names_fem << line[0]
    }
    all_names = names_mas + names_fem 

    return {
      names_mas: names_mas.sort,
      names_fem: names_fem.sort,
      all_names: all_names,
      all_names_sort: all_names.sort
    }
  end
  
end
