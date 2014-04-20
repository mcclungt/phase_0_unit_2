# U2.W6: Testing Assert Statements

# I worked on this challenge by myself.


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
#assert { name == "bettysue" }
#assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
# The assert method raises an exception if the variables don't match.
# In this example, name == "bettysue" passes the assertion, but name
# == "billybob" does not, and gives an error message.

# 3. Copy your selected challenge here
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

# 4. Convert your driver test code from that challenge into Assert Statements
game = GuessingGame.new(10)

assert {game.solved? == false}

assert {game.guess(5) == :low}
assert {game.guess(20) == :high}
assert {game.solved? == false}

assert {game.guess(10) == :correct}
assert {game.solved? == true}

# 5. Reflection
# This assert method seems like a very good way to test code. Instead of relying
# on print statements, you can actually get error messages that pertain to a specific
# problem. In the future, I would expand upon the assert method so it would take parameters
# and I wouldn't have to write xx == xx for every statement, but otherwise it seems
# very efficient.