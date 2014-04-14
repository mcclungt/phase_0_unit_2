# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself
# 2. Pseudocode

# Input:
# => Takes parameter labels which is an array of strings
# Output:
# => sides method returns the length of labels, and roll method
# => returns a random string from labels
# Steps:
# => CREATE Die class
# => CREATE initialize method that takes labels as a parameter
# => CREATE argument error loop that raises if labels length is
# 			less than or equal to zero
# => SET @labels to labels
# => CREATE sides method that returns length of @labels
# => CREATE roll method that returns a random string from @labels

# 3. Initial Solution

class Die
	def initialize(labels)
		unless labels.length > 0
			raise ArgumentError.new("Must be longer than 0")
		end
		@labels = labels
	end

	def sides
		return @labels.length
	end

	def roll
		return @labels.sample
	end
end

# 4. Refactored Solution
# My code appears to be fully refactored

# 1. DRIVER TESTS GO BELOW THIS LINE


# 5. Reflection
# Only hiccup I had was that I accidentally used .shuffle
# instead of .sample at first, causing my command prompt
# to run for a while before failing a few of the rspec 
# tests. Other than that it was a little bit easier than
# the other die challenge because the labels was already
# in an array and I didn't have to change it.