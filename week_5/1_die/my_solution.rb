# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# => Takes parameter sides which should be a number
# Output:
# => sides method returns @sides, number of sides
# => roll method returns random number between 1 and @sides
# Steps:
# => CREATE Die class
# => CREATE initialize method that takes sides as a parameter
# => CREATE argument error loop if sides <= 0
# => SET @sides to sides
# => CREATE sides method that returns @sides
# => CREATE roll method
# => RETURN	@sides converted into a random number between 1 and sides


# 3. Initial Solution

class Die
  def initialize(sides)
  	unless sides > 0
  		raise ArgumentError.new("Must be greater than 0")
  	end
  	@sides = sides
    # code goes here
  end
  
  def sides
  	return @sides
    # code goes here
  end
  
  def roll
  	return (1..@sides).to_a.sample
    # code goes here
  end
end

# 4. Refactored Solution
# My solution is fully refactored as far as I can tell.

# 1. DRIVER TESTS GO BELOW THIS LINE

# 5. Reflection
# Classes get tricky for me sometimes, but in this case
# it was fairly straightforward. This is my first experience
# raising the ArgumentError but again it was really straightforward
# and it's definitely easier to raise than exceptions in
# a lot of other languages.