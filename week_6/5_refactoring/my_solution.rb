# U2.W6: Refactoring for Code Readability


# I worked on this challenge by myself.


# Original Solution
# class CreditCard
# 	def initialize(number)
# 		@number = number
# 		unless @number.to_s.length == 16
# 			raise ArgumentError.new("Must be a 16 digit number")
# 		end
# 	end
# 	def checkCard()
# 		string = @number.to_s
# 		@array = string.split("")
# 		for i in 0..(@array.length - 1)
# 			if i % 2 == 0
# 				@array[i] = ((@array[i].to_i)*2).to_s
# 			end
# 		end
# 		stepTwo()
# 	end
# 	def stepTwo()
# 		@sum = 0
# 		@array.each do |x|
# 			if x.length == 2
# 				double = x.split("")
# 				@sum += (double[0].to_i + double[1].to_i)
# 			else
# 				@sum += x.to_i
# 			end
# 		end
# 		results()
# 	end
# 	def results()
# 		return @sum % 10 == 0
# 	end
# end
# Refactored Solution
class CreditCard
	def initialize(number)
		@number = number
		raise ArgumentError.new("Must be a 16 digit number") unless @number.to_s.length == 16
	end
	def checkCard()
		@sum = 0
		string = @number.to_s
		@array = string.split("")
		for i in 0..(@array.length - 1)
			@array[i] = ((@array[i].to_i)*2).to_s if i % 2 == 0		
		end
		@array.each do |number|
			if number.length == 2
				double = number.split("")
				@sum += (double[0].to_i + double[1].to_i)
			else
				@sum += number.to_i
			end
		end
		@sum % 10 == 0
	end
end
# DRIVER TESTS GO BELOW THIS LINE
card = CreditCard.new(4563960122001999)
p card.checkCard == true
card = CreditCard.new(4408041234567893)
p card.checkCard == true
card = CreditCard.new(4408041234567892)
p card.checkCard == false
# Reflection
# I didn't realize how much I could refactor this code. I'm sure
# a few weeks from now I'll look back and find 5 or 6 more things
# I can do to refactor the code, but for now I think it's a good
# yardstick as to how much better I'm understanding this. I combined
# all the methods aside from the constructor into one method, which
# seems kind of obvious because there isn't much of a point in having
# 3 methods that only have 1 purpose. I shortened some statements to
# one line, and I changed some variable names to be a little bit more clear.