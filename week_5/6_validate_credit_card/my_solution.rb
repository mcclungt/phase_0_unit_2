# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# => The input should be a 16 digit number
# Output:
# => The output is a boolean, whether it's a valid number
# Steps:
# => CREATE initialize method, set value(s)
# => CREATE unless statement that raises an error if invalid
# => CONVERT number to array of individual digits
# => PARSE through array and multiply odd digits by 2
# => CONVERT 2 digit numbers to individual digits and add all
# 	 digits to a final sum
# => CHECK if sum is divisible by 10
# => RETURN true if divisible

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
	def initialize(number)
		@number = number
		unless @number.to_s.length == 16
			raise ArgumentError.new("Must be a 16 digit number")
		end
	end
	def checkCard()
		string = @number.to_s
		@array = string.split("")
		for i in 0..(@array.length - 1)
			if i % 2 == 0
				@array[i] = ((@array[i].to_i)*2).to_s
			end
		end
		stepTwo()
	end
	def stepTwo()
		@sum = 0
		@array.each do |x|
			if x.length == 2
				double = x.split("")
				@sum += (double[0].to_i + double[1].to_i)
			else
				@sum += x.to_i
			end
		end
		results()
	end
	def results()
		return @sum % 10 == 0
	end
end
# 4. Refactored Solution

# 1. DRIVER TESTS GO BELOW THIS LINE
card = CreditCard.new(4563960122001999)
p card.checkCard == true
card = CreditCard.new(4408041234567893)
p card.checkCard == true
card = CreditCard.new(4408041234567892)
p card.checkCard == false

# 5. Reflection 
# Something isn't quite right with this one. I felt like
# I might have done some unnecessary conversion between integers
# and strings in order to get them in an array nicely, but the
# main problem is the rspec. It doesn't seem to check my code properly,
# as values are failing for me. I converted them into driver code tests 
# and they worked fine, so I'm really not too sure about it.