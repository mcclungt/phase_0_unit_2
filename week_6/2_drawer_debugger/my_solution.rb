# U2.W6: Drawer Debugger


# I worked on this challenge [by myself, with: ].


# 2. Original Code

def assert
  raise "Assertion failed!" unless yield
end

class Drawer

	attr_reader :contents

# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing? -- removing and returning the item from @contents
		@contents.delete(item)
	end

	def dump  # what should this method return? -- should empty the array
		@contents.length.times {remove_item(@contents[0])}
		puts "Your drawer is now empty."
	end

	def view_contents
		puts "The drawer contains:"
		if @contents.length > 0
			@contents.each {|silverware| puts "- " + silverware.type}
			@contents[@contents.length-1] #for debugging purposes
		else
			puts "nothing"
			"nothing"
		end
	end
end

class Silverware
	attr_reader :type

	# Are there any more methods needed in this class?

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

	def clean_silverware
		puts "silverware is cleaned"
		@clean = true
	end

	def clean
		"the #{type} is "+(@clean ? "clean" : "dirty")
	end
end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?
fork = Silverware.new("fork")
silverware_drawer.add_item(fork)
fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
fork.eat

#BONUS SECTION
puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE
assert {silverware_drawer.view_contents == "nothing"}
fork = Silverware.new("fork")
silverware_drawer.add_item(fork)
assert {silverware_drawer.view_contents == fork}
fork = silverware_drawer.remove_item(fork)
assert {silverware_drawer.view_contents == "nothing"}
assert {fork.clean == "the fork is clean"}
fork.eat
assert {fork.clean == "the fork is dirty"}

# 5. Reflection 
# I'm not particularly happy about this one. I spent over an hour trying to
# get my driver tests to work properly, but for some reason I can't get my
# assert statement to work quite how I wanted, so I added that return statement
# on line 51 so it will at least assert the most recently added item. Otherwise,
# the code seems a little bit all over the place, but it performs how it's needed.
# I'm not sure if this is what was expected by using fork.clean, but since we already
# had fork.clean_silverware I figured it was appropriate.