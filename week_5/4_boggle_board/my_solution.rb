# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge by myself.

$boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
# Initial Solution
# Refactored Solution
def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
end
# DRIVER TESTS GO BELOW THIS LINE
puts create_word($boggle_board, [2,1], [1,1], [1,2], [0,3])  #=> returns "code"  
puts create_word($boggle_board, [0,1], [0,2], [1,2])  #=> creates what california slang word?
# Reflection
# => It's rad.
#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# Input:
# => get_row takes variable row, which is a number
# Output:
# => get_row should return a row of variables in the form of an array
# Steps:
# => CREATE get_row method that takes row (integer) as a parameter
# => CREATE each loop that parses through and returns row to array
# Initial Solution
# def get_row(row)
# 	array = []
#     $boggle_board[row].each do |x|
#     	array >> x
#     end
#     return x
# end
# Refactored Solution
def get_row(row)
    $boggle_board[row].each do |x|
    	x
    end
end
# DRIVER TESTS GO BELOW THIS LINE
p get_row(1) ==  ["i", "o", "d", "t"]
# Reflection 
# I'm pretty satisfied with this refactor. I had to change the boggle
# board into a global variable so I could access it, but it works.
# Otherwise I would add a parameter to the method and pass it through
# the constructor.

#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# Input:
# => get_col takes the col parameter which is a number
# Output:
# => get_col returns array, which is an array of numbers in the specified column
# Steps:
# => CREATE get_col method that takes parameter col (integer)
# => CREATE array to store column in
# => CREATE for loop that stores column array numbers into array
# => RETURN array
# Initial Solution
def get_col(col)
	array = []
    for i in 0..($boggle_board.length - 1)
    	array[i] = $boggle_board[i][col]
    end
    return array
end
# Refactored Solution

# DRIVER TESTS GO BELOW THIS LINE
puts get_col(1) ==  ["r", "o", "c", "a"]
puts $boggle_board[0][1] == "r" # returns boggle_board[row_number][column_number]
puts $boggle_board[2][1] == "c" #=> should be true
puts $boggle_board[3][3] == "e" #=> should be true
puts $boggle_board[2][3] == "x" #=> should be false
# Reflection 
# I spent a lot of time on this, trying to make it work with an each loop, but
# I wasn't able to. For some reason my code wasn't working, so I decided to use
# the familiar for loop. It allowed me to store the variables in an array which
# isn't as concise as the row loop, but it works.