# U2.W4: Cipher Challenge

# I worked on this challenge with:

#Sam / Jake / Tim 

# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs. Downcase method downcases first letter and split separates a string, in this case, with nothing added in between. 
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? The rotate method will automatically shift an object's elements either right or left the given amount. So in this case, a rotate(4) will be effective. 
            "f" => "b",   # Is a hash the best data structure for this problem? What are the pros and cons of hashes? A hash is more effective when a key and value pair are needed, which in this case seems to be true as the cipher is made up of pairs. 
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",     
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here? The each method is iterating through the block, in this case, the user input that has been split to each character. 
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true? The variable is instantiated to false because it's acting as a flag for whether or not a match has been found. On lines 50, 54, and 58 you can see the variable is changed to true, this occurs if the letters match, or it is a symbol or number.
    cipher.each_key do |y| # What is #each_key doing here? Each_key parses through the key values. If the character found matches a key, the loop will append the cypher's answer to the decoded sentence.
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really? The two variables in the hash, in this case x would be the key and y would be the value. In the case of the method, x is the input by the user and y is the encoded character. 
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here? It breaks here in order to terminate the internal loop so that the code can continue.  
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing? If user input is a symbol, convert into a space. 
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does "(0..9).to_a " do? This converts the numbers between 0 - 9 inclusive to an array that can then be compared to the user input to see if it includes a number.
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for? If the input doesn't match any of the above rules, keep the character as is. 
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. \d is any digit and + is one or  more digits, so this is looking for a number in the decoded_sentence
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate... And this divides it by 100 
  end  
  return decoded_sentence # What is this returning? Returning our final decoded_sentence       
end

# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") 
  decoded_sentence = []
  found_match = false
  alphabet = ('a'..'z').to_a
  cipher = Hash[alphabet.zip(alphabet.rotate(-4))] 
  symbols = ["@", "#", "$", "%", "^", "&", "*"] 
  input.each do |x| 
    found_match = false  
    cipher.each_key do |y| 
      if x == y 
        decoded_sentence << cipher[y]
        found_match = true
        break
      elsif symbols.include?(x) 
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) 
        found_match = true
        break
      end 
    end
    if not found_match 
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("") 
  if decoded_sentence.match(/\d+/)
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 }
  end
  return decoded_sentence
end

# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!" 
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"

# Reflection
# I feel like this group project went along very smoothly.
# That's not to say that we didn't run into some hiccups
# and speedbumps along the way, but for every problem we had
# we were able to attack the issue from multiple angles.
# Each of us had a different strategy to try out and with
# some trial and error we were able to figure out what to do.
# I learned about the rotate method and we were able to use it
# to conserve a lot of space in the creation of a hash.