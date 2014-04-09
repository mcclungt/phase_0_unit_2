# U2.W4: Refactor Cipher Solution

# I worked on this challenge by myself.

# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)                     # makes a method that takes a sentence parameter
    alphabet = ('a'..'z').to_a                        # sets alphabet array equal to letters a-z
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]   # sets cipher hash keys equal to the alphabet,
                                                      # sets cipher hash values equal to the alphabet rotated 4 times
    spaces = ["@", "#", "$", "%", "^", "&", "*"]      # array contains symbols listed
    original_sentence = sentence.downcase             # sets a variable equal to the input turned downcase
    encoded_sentence = []                             # sets a blank array
    original_sentence.each_char do |element|          # for each character in the array:
      if cipher.include?(element)                     # => if the value of the character is the same as the input:
        encoded_sentence << cipher[element]           # =>     adds value from hash to empty array
      elsif element == ' '                            # => if the value is an empty space:
        encoded_sentence << spaces.sample             # =>     adds random value from spaces array
      else                                            # => otherwise:
        encoded_sentence << element                   # =>     adds the value
      end
    end
    
    return encoded_sentence.join                      # return the the values of the arrays joined
end


# Questions:
# 1. What is the .to_a method doing?
# => Converts the previous object into an array
# 2. How does the rotate method work? What does it work on?
# => Rotate moves the values of the array backwards by the amount in the input, only works on arrays
# 3. What is `each_char` doing?
# => Parsing through each character in the string provided
# 4. What does `sample` do?
# => Picks a random value from the given array
# 5. Are there any other methods you want to understand better?
# => I think I understand .zip but it's a little confusing
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# => One of the members of our group had done it already so we borrowed some of it, but it's mostly the same
# 7. Is this good code? What makes it good? What makes it bad?
# => This is good code, but it seems to act a little bit destructively. I'm not really sure how I would improve it,
# => but it's safe to assume there's always a better way.

# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
# => Nope, the symbols are random.
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")

# 5. Reflection 
# This assignment worked very well hand in hand with the group
# project. It was interesting to see both sides of it, and it's
# cool to see that we had previously programmed the exact opposite
# of this method. I learned more about the built in ruby methods that
# were used, and I think it's a great exercise to go through and
# comment every line. 