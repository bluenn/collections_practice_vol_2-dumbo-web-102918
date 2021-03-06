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

def count_elements(tools)
  count = 0
  dupes = []
  match = ""
  tools.select do |element|
    value = element[:name]
    hash = {}
   if count == 0
     count = 1
     hash[:name] = value
     match = value
     hash[:count] = 1
     dupes.push(hash)
   else
     if match == value
       count += 1
       hash[:count] = count
       puts hash
       dupes[0][:count] = count
      end
      count = 0
    end
 end
 dupes
end



def merge_data(keys, data)
  #data{0] is a hash all its values which are hashes themselves -
  #mow we have an array of hash in data[0].values.
  #second array is keys
   data[0].values.map.with_index do |value, index|
     keys[index].merge(value)
     binding.pry
   #merge data with keys and then collect,
  # each value is {:awesomeness=>10, :height=>"74", :last_name=>"johnson"}
  #keys is [{:first_name=>"blake"}, {:first_name=>"ashley"}] but merge by index
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


# def organize_schools(schools)
#   organized_schools = {}
#   new_hash = {}
#
#   schools.each do |key, value|
#     city = value[:location]
#     new_hash[city] = []
#
#     new_hash[city].push(key)
#     new_hash[city].push(schools.key(value))
#   end
#
#   new_hash["NYC"] = new_hash["NYC"].insert(1,"flatiron school").reverse
#   new_hash["SF"] = new_hash["SF"].reverse
#   new_hash["Chicago"].delete_at(1)
#   new_hash
# end


def organize_schools(schools)
  new_hash = {}
  schools.each do |school, location|
    city = location[:location]
    if new_hash[city]
      new_hash[city] << school
    else
      new_hash[city] = []
        new_hash[city] << school
    end
  end
  new_hash
end
