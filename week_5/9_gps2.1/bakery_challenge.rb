# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1)
# 2)

 # This is the file you should end up editing. 
 
def bakery_num(num_of_people, fav_food)
    my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} # my_list is a hash. Numbers tell how much each food feeds.
    quantity = {"pie" => 0, "cake" => 0, "cookie" => 0}
  
    has_fave = false # boolean value for favorite

    unless my_list.key?(fav_food)
      raise ArgumentError.new("You can't make that food")
    end
    fav_food_qty = my_list.values_at(fav_food)[0] #Checks the key of favorite food. Sets to value associeted with key.
    if num_of_people % fav_food_qty == 0 #looking for the remainder of people divided by favorite food quantity. 
      num_of_food = num_of_people / fav_food_qty #Checks to see if number is equally divisible. Then sets number for what is returned
      return "You need to make #{num_of_food} #{fav_food}(s)."# tells how much food needs to be made.
    else
      start = false
      my_list.each do |x, y|
        start = true if x == fav_food
        if start == false
          quantity[x] = 0
        else
          quantity[x] = (num_of_people / y)
          num_of_people %= y
        end
      end
    return "You need to make #{quantity["pie"]} pie(s), #{quantity["cake"]} cake(s), and #{quantity["cookie"]} cookie(s)."
    end
  end

 #driver code
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie")# == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
#p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake")# == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!