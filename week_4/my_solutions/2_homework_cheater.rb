# U2.W1: Homework Cheater

# I worked on this challenge by myself

# 1. Pseudocode
# What is the input?
# => The method essay_writer takes 5 inputs: essay title,
# => essay topic, important date, thesis statement, and topic
# => gender.
# What is the output?
# => The method outputs variable gender, which is an array containing
# => the lines that should be in the array.
# What are the steps needed to solve this problem?
# => CREATE method essay writer that takes 5 parameters
# => SET variable pronoun to default (she)
# => INITIALIZE essay array (empty)
# => CREATE if statement for gender, changes pronoun accordingly
# => FLIP topic to contain last name first
# => STORE essay statements into essay array
# => RETURN essay

def essay_writer(title, topic, date, thesis_statement, gender)
	pronoun = "she"
	essay = []
	if gender == "male"
		pronoun = "he"
	elsif gender == "plural"
		pronoun = "they"
	end
	topic = topic.split.to_a.rotate(1)
	topic = "#{topic[0]} #{topic[1]}"
	essay << "The Curious Case of #{title}"
	essay << "When writing about #{topic} it's always important to focus on what #{pronoun} did in #{date}."
	essay << thesis_statement
	essay << "Remember, without #{topic}, we might not be here today!"
	return essay
end

puts essay_writer("The First Shogun", "Tokugawa Ieyasu", 1603, "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years.", "male")
puts essay_writer("The Tale of Genji", "Shikibu Murasaki", 1010, "She wrote The Tale of Genji, which is generally considered to be the greatest work of Japanese literature and possibly the world's first novel.", "female")
puts essay_writer("The Most Celebrated Musicians", "Scorpions the", 1984, "The Scorpions released 'Rock You Like a Hurricane' to worldwide critical acclaim.", "plural")

# Reflection
# I felt that this challenge was pretty easy. The previous challenge,
# create accountability groups, was muuuuch harder, so this felt like 
# a more fun, basic challenge. It felt like I couldn't really refactor
# this, but it feels like that's becoming a trend for my programs.
# Line 30 worked remarkably well, although I think it might be possible
# to squeeze lines 30 and 31 together into one line.