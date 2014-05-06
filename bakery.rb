def food_to_bake(num_of_people, fav_food)

  food_servings = {"pie" => 8, "cake" => 6, "cookie" => 1}  
  food_to_make = {"pie" => 0, "cake" => 0, "cookie" => 0}
  fav_food_servings = food_servings.values_at(fav_food)[0]
  
  raise ArgumentError.new("You can't make that food") unless food_servings.has_key?(fav_food)
  # checks if the fav_food argument is included in the list of foods we can make

  if num_of_people % fav_food_servings == 0
    qty_to_make = num_of_people / fav_food_servings
    "You need to make #{qty_to_make} #{fav_food}(s)."

  else
    food_servings.each do |food, servings|   
      if servings <= fav_food_servings
        qty_to_make = num_of_people / servings
        num_of_people = num_of_people % servings
        food_to_make.merge!(food => qty_to_make)
      end
    end
    "You need to make #{food_to_make["pie"]} pie(s), #{food_to_make["cake"]} cake(s), and #{food_to_make["cookie"]} cookie(s)."
  end

end
 
#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p food_to_bake(24, "cake") == "You need to make 4 cake(s)."
p food_to_bake(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p food_to_bake(24, "cookie") == "You need to make 24 cookie(s)."
p food_to_bake(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p food_to_bake(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p food_to_bake(3, "apples") # this will raise an ArgumentError