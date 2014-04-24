# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself.


# Pseudocode
# Input:
# => Song class takes title and artist
# => Playlist class takes either a song or multiple songs
# Output:
# => Song class can return a puts statement
# => Playlist either returns a boolean value, a number, or a puts statement
# Steps:
# => CREATE song class
# => CREATE initalize method, set title and artist
# => CREATE play method, outputs a puts statement
# => CREATE display method, outputs a puts statement

# => CREATE playlist class
# => CREATE initalize method that takes any number of songs
# => INITALIZE playlist array
# => APPEND songs to playlist
# => CREATE add method, appends songs to playlist
# => CREATE num_of_tracks method, returns length of playlist
# => CREATE remove method, delete song from array
# => CREATE includes? method, returns boolean for whether or not song is included
# => CREATE play_all method, calls play method for each song
# => CREATE display method, calls display method for each song

# Initial Solution
# class Song
# 	def initialize(title, artist)
# 		@title = title
# 		@artist = artist
# 	end

# 	def play
# 		puts "Playing #{@title}"
# 	end

# 	def display
# 		puts "#{@artist} - #{@title}"
# 	end
# end

# class Playlist
# 	def initialize(*songs)
# 		@playlist = []
# 		songs.each do |x|
# 			@playlist << x
# 		end
# 	end

# 	def add(*songs)
# 		songs.each do |x|
# 			@playlist << x
# 		end
# 	end

# 	def num_of_tracks
# 		@playlist.length
# 	end

# 	def remove(song)
# 		@playlist.delete(song)
# 	end

# 	def includes?(song)
# 		@playlist.include?(song)
# 	end

# 	def play_all
# 		@playlist.each do |x|
# 			x.play
# 		end
# 	end

# 	def display
# 		@playlist.each do |x|
# 			x.display
# 		end
# 	end
# end
# Refactored Solution
class Song
	def initialize(title, artist)
		@title = title
		@artist = artist
	end

	def play
		puts "Playing #{@title}"
	end

	def display
		puts "#{@artist} - #{@title}"
	end
end

class Playlist
	def initialize(*songs)
		@playlist = []
		songs.each {|song| @playlist << song}
	end

	def add(*songs)
		songs.each {|song| @playlist << song}
	end

	def num_of_tracks
		@playlist.length
	end

	def remove(song)
		@playlist.delete(song)
	end

	def includes?(song)
		@playlist.include?(song)
	end

	def play_all
		@playlist.each {|song| song.play}
	end

	def display
		@playlist.each {|song| song.display}
	end
end

# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display

# Reflection
# Pretty neat. I have a tendency to try to outline the entirety of
# a program before debugging it. It usually works against me, as I
# have a harder time tracing through the code to find where my problems
# are, but sometimes it just works out. In this case, I had to make a few
# minor syntax tweaks but otherwise it worked out. To be honest I was a
# bit surprised. I am very confident in my refactorization.