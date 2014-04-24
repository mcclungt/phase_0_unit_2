# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself.


# 2. Pseudocode



# 3. Initial Solution
class BoggleBoard
	def initialize(board)
		@board = board
	end
	def create_word(*coords)
		coords.map { |coord| @board[coord.first][coord.last]}.join("")
	end
	def get_row(row)
    	@board[row].each {|x| x}
	end
	def get_col(col)
		array = []
    	for i in 0..(@board.length - 1)
    		array[i] = @board[i][col]
    	end
    return array
	end
	def get_letter(x, y)
		@board[x][y]
	end
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
puts boggle_board.create_word([1,2], [1,1], [2,1], [3,2])
for i in 0..3
	p boggle_board.get_row(i)
	p boggle_board.get_col(i)
end

# ["b", "r", "a", "e"]
# ["b", "i", "e", "t"]
# ["i", "o", "d", "t"]
# ["r", "o", "c", "a"]
# ["e", "c", "l", "r"]
# ["a", "d", "l", "k"]
# ["t", "a", "k", "e"]
# ["e", "t", "r", "e"]
# 4. Refactored Solution

# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
puts boggle_board.get_letter(3,2)

# 5. Reflection
# While this concept was relatively simple (converting an earlier set
# of methods into a set of classes) it took me a little while to get
# the workings just right. I am confident that my solution was fully
# refactored when it was finished. I created the get_letter method 
# purely for the driver test to work properly.