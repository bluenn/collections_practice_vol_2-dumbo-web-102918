# your code goes here
require 'pry'

def begins_with_r(tools)
  tools.any? do |element|
    if !element.start_with?("r")
      return false
    end
  end
 true
end

def contain_a(tools)
  tools.select do |element|
  element.include?("a")
  #element.match(/a/)
  end
end

def first_wa(tools)
  tools.find do |word|
    word.to_s.start_with?("wa")
  end
end

def remove_non_strings(tools)
  tools.delete_if do |element|
  element.class != String
 end
end

# def count_elements(tools)
#   count = 0
#   dupes = []
#   match = ""
#   tools.select do |element|
#     value = element[:name]
#     hash = {}
#    if count == 0
#      count = 1
#      hash[:name] = value
#      match = value
#      hash[:count] = 1
#      dupes.push(hash)
#    else
#      if match == value
#        count += 1
#        hash[:count] = count
#        puts hash
#        dupes[0][:count] = count
#       end
#       count = 0
#     end
#  end
#  dupes
# end

def count_elements(tools)
hash = {}
dupes = []
count = 0
hash = {}
  sep = tools.uniq do |element|
    #hash[:name] = element[:value]
    hash = {}
    count = tools.count(element)
    hash[:name] = element[:name]
    hash[:count] = count
    dupes << hash
    count = 0
  end
  puts sep
  dupes
  binding.pry
  #dupes << hash
end




def merge_data(keys, data)
  #data{0] is a hash all its values which are hashes themselves -
  #mow we have an array of hash in data[0].values.
  #second array is keys
   data[0].values.map.with_index do |value, index|
     keys[index].merge(value)
   #merge data with keys and then collect,
   #so merge {first_name => "blake"} with
  #  {
  #    "blake" => {
  #      :awesomeness => 10,
  #      :height => "74",
  #      :last_name => "johnson"
  #    },
  # and get
  # {
  #     :first_name => "blake",
  #     :awesomeness => 10,
  #     :height => "74",
  #     :last_name => "johnson"
  #  },
   end
 end

def find_cool(cool)
 cool.select do |element|
    cool_string = element[:temperature]
      cool_string.match(/^[cool]+$/)
      #the "^" and "$" mean "start" and "end" of the string.
      #Without them, the regex will succeed as long as it matches any portion of the string.
  end
end

def organize_schools(schools)
  organized_schools = {}

  flat = schools.values.each_with_index do |element, index|
    location = element[:location]
    #organized_schools[location] = []
    temp_array = []
    key = schools.keys[index]
    temp_array.push(key)
    #organized_schools[location].push([temp_array])
  end
  puts flat
  organized_schools
 end
