require 'csv'
require './load_data.rb'
require './binary_search.rb'

# Busca individual
def search_individual_name(data)
    index = BinarySearch.search('DAYAN', data[:all_names_sort], 0, data[:all_names_sort].count)
    puts "Search =>  #{data[:all_names_sort][index]}" if BinarySearch.found? index    
end


def search_male_and_female_name(data, name)
    index_mas = BinarySearch.search(name, data[:names_mas], 0, data[:names_mas].count)
    puts "Search male name =>  #{data[:names_mas][index_mas]}" if BinarySearch.found? index_mas

    index_fem = BinarySearch.search(name, data[:names_fem], 0, data[:names_fem].count)
    puts "Search female name =>  #{data[:names_fem][index_fem]}" if BinarySearch.found? index_fem
    
    if BinarySearch.found?(index_mas) && BinarySearch.found?(index_fem)
        puts "Name both contains" if data[:names_mas][index_mas] == data[:names_fem][index_fem]
    end
end


def search_with_thread(data, name)
    thr_mas = Thread.new {
        index = BinarySearch.search(name, data[:names_mas], 0, data[:names_mas].count)
        puts "binary search mas =>  #{data[:names_mas][index]}" if BinarySearch.found? index
        data[:names_mas][index]
    }
    
    thr_fem = Thread.new {
        index = BinarySearch.search(name, data[:names_fem], 0, data[:names_fem].count)
        puts "binary search fem =>  #{data[:names_fem][index]}" if BinarySearch.found? index
        data[:names_fem][index]
    }
    
    thr_mas.join
    thr_fem.join
    
    puts "Thread mas value => #{thr_mas.value}"
    puts "Thread fem value => #{thr_fem.value}"
end

def run_start
    data = Data.load_names
    puts "\n"
    puts "Load data..."
    puts "names_mas #{data[:names_mas].count}"
    puts "names_fem #{data[:names_fem].count}"
    puts "all_names #{data[:all_names].count}"
    puts "\n"
    search_individual_name data
    
    puts "\n"
    puts "by name: CLAUDEILSON"
    search_male_and_female_name data, 'CLAUDEILSON'

    puts "\n"
    puts "by name: JOSE"
    search_male_and_female_name data, 'JOSE'

    puts "\n"
    puts "Thread by name: CLAUDEILSON "
    puts "\n"
    search_with_thread data, 'CLAUDEILSON'
    puts "\n"

    puts "Thread by name: JOSE "
    puts "\n"
    search_with_thread data, 'JOSE'
    puts "\n"
end

run_start