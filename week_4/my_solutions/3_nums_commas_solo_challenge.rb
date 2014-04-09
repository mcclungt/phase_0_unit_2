# U2.W4: Separate Numbers With Commas

# I worked on this challenge by myself

# 1. Pseudocode
# What is the input?
# => The method separate_comma takes a number as its input.
# What is the output?
# => The method outputs a string with the number separated by
# => commas in their respective locations.
# What are the steps needed to solve this problem?
# => CREATE method that takes a number as a parameter
# => SET array variable to number converted into digits converted into strings 
# =>  and reversed
# => SET variable to increase size of array by the number of needed commas
# => CREATE for loop to parse through array, shifts values over and puts in 
# =>  comma if necessary
# => REVERSE array and join values into string
# => RETURN string

def separate_comma(num)
	array = num.to_s.split(//).to_a.reverse
	arrayBuffer = ((array.length-1)/3.0).floor
	commas = array.length+arrayBuffer
	for i in 1..commas-1
		 if i%4 == 3
		 	for j in commas.downto(i)
		 		array[j] = array[j-1]
			end
		 	array[i] = ","
		 end
	end
	string = array.reverse.join
	return string
end

separate_comma(10000)

# Reflection
# Yikes. This one got kind of messy I admit, and I'm sure there's a much
# simpler solution, but this was the only way I was able to do it. By turning
# the number into an array and flipping it backwards, I was able to find the 
# places to insert the commas, but I still had to shift the array over one
# step to preserve the number. Nevertheless it worked, and I used some new
# methods like .floor and .downto in order to create it.