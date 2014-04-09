# U2.W1: Create Accountability Groups

# I worked on this challenge with Kennedy

# 1. Pseudocode
# What is the input?
# => The group method takes an input names which
# => is an array of strings.
# What is the output?
# => The method outputs 3 different sets of groups,
# => each with 4 or 5 people.
# What are the steps needed to solve the problem?
# => CREATE method group, takes an array as parameter
# => SET empty array named units
# => CREATE times loop to make 3 sets of groups
# => SET names variable to shuffled group
# => SET empty array named remainder
# => SET count variable to the remainder of names / 4
# => SHIFT names variable into remainder array
# => SET groupsArray variable to names array sliced into groups of 4
# => SHIFT remainder variable into arrays inside groupsArray
# => RETURN units

def group(names)
	units = []
	3.times do
		names = names.shuffle
		remainder = []
		count = names.length % 4
		count.times do
			remainder << names.shift
		end
		groupsArray = names.each_slice(4).to_a
		while count != 0
			groupsArray[count-1] << remainder.shift
			count -= 1
		end
		units << groupsArray
	end
	return units
end

sample = ["Adeoye", "Brittaney", "Chantelle", "Charu", "Danielle", "David", "Dinesh", "Gregory", " Ian", "Jake", "Jason", "Jessica", "John", "Judy", "Justin", "Kai", "Ken", "Kennedy", "Kevin", "Lasse", "Natalie", "Nick", "Samuel", "Timothy", "STEEEEEEVEEEEEE", "BILLYYYYY", "JEFFFFFFFF"]
uneven = ["Adeoye", "Brittaney", "Chantelle", "Charu", "Danielle", "David", "Dinesh", "Gregory", " Ian", "Jake", "Jason", "Jessica", "John", "Judy", "Justin", "Kai", "Ken", "Kennedy", "Kevin", "Lasse", "Natalie", "Nick", "Samuel", "Timothy", "STEEEEEEVEEEEEE", "BILLYYYYY", "JEFFFFFFFF"]

p group[sample]
p group[uneven]

# Reflection
# This challenge was simple to conceptualize,
# but aspects of it were very difficult to implement.
# I was unable to think of a way to implement it so that
# people wouldn't be in the same group twice, but I was
# able to implement randomness and a way to pile groups
# into a set of 5 while still defaulting to a set of 4.
# I'm not really sure about testing, since randomness
# makes it difficult to really test anything.