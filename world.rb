require_relative 'continent'
require_relative 'country'

class World
  def initialize
    @continent = Continent.new
    @country = Country.new
  end

  def countries_continents
    @continent.countries
  end

  def max_population
    @country.country_max_population
  end

  def countries_inflation
    @country.five_countries_highest_inflation
  end
end

world = World.new
puts "\n", world.max_population, "\n"
puts world.countries_inflation, "\n"
puts world.countries_continents, "\n"
