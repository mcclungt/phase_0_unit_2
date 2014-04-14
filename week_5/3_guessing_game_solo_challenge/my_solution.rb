# U2.W5: Build a simple guessing game SOLO CHALLENGE

# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# => GuessingGame#initialize takes answer, which is the number
# 	 the user is trying to guess
# => GuessingGame#guess takes guess, which is the user's guess
# Output:
# => GuessingGame#guess returns :high, :low, or :correct based
# 	 on the user's previous guess
# => GuessingGame#solved? returns boolean variable @done, which
# 	 is true or false based on the user's previous guess
# Steps:
# => SET initialize method to have @done variable and @answer variable
# => CREATE guess method, takes guess (integer) parameter
# => CREATE if statement, returns high low or correct and changes @done
# => CREATE solved? method, returns @done


# 3. Initial Solution
# class GuessingGame
#   def initialize(answer)
#     @answer = answer
#   	@done = false
#   end
#   def guess(guess)
#   	if guess < @answer
#   		@done = false
#   		return :low
#   	elsif guess > @answer
#   		@done = false
#   		return :high
#   	else
#   		@done = true
#   		return :correct
#   	end
#   end
#   def solved?()
#   	return @done
#   end
# end
# 4. Refactored Solution
class GuessingGame
  def initialize(answer)
    @answer = answer
  	@done = false
  end
  def guess(guess)
  	if guess == @answer
  		@done = true
  		return :correct
  	else
  		@done = false
  		(guess > @answer) ? :high : :low 
  	end
  end
  def solved?()
  	return @done
  end
end
# 1. DRIVER TESTS GO BELOW THIS LINE
game = GuessingGame.new(10)

p game.solved? == false

p game.guess(5) == :low
p game.guess(20) == :high
p game.solved? == false

p game.guess(10) == :correct
p game.solved? == true
# 5. Reflection 
# I was finally able to refactor some of my code! This assignment
# was relatively simple. It seems like classes are making more and
# more sense to me with every assignment. I was able to make that
# neat little one line if-else statement on line 57 which is nice,
# and I'm wondering if I should stop putting "return" in front of
# my return variables. I prefer this method to the interface method
# of making a guessing game because it would be easier to use this
# class inside of other classes.