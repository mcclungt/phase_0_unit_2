# U2.W5: Virus Predictor

# I worked on this challenge by myself.

# EXPLANATION OF require_relative
# Require relative checks to make sure that there is another file
# in the same folder named the input. That file can now be referenced
# with in the file.
require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread) # The initialize method converts
    @state = state_of_origin                                                               # all of the parameters into callable
    @population = population                                                               # variables.
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths(@population_density, @population, @state)                             # Instance variables are limited to the method
    speed_of_spread(@population_density, @state)                                           # they are initialized in.
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method # Private masks everything so that it
                                                                                           # cannot be called from a different class.
  def predicted_deaths(population_density, population, state)                              # It limits the scope available for a segment.
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor                                         # predicted_deaths takes 3 inputs and calculates
    elsif @population_density >= 100                                                       # number_of_deaths based on the inputs. Then it
      number_of_deaths = (@population * 0.2).floor                                         # prints a string which predicts the deaths in the
    elsif @population_density >= 50                                                        # relevent state.
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  def speed_of_spread(population_density, state) #in months
    speed = 0.0

    if @population_density >= 200                                                          # speed_of_spread takes 3 inputs and calculates
      speed += 0.5                                                                         # speed based on the inputs. Then it prints a string
    elsif @population_density >= 150                                                       # that predicts the speed.
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects