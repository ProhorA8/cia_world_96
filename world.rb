require_relative 'continent'
require_relative 'country'

class World
  def countries_continents
    load_data_from_file
    @continent.countries
  end

  def max_population
    load_data_from_file
    @country.country_max_population
  end

  def countries_inflation
    load_data_from_file
    @country.five_countries_highest_inflation
  end

  private

  def load_data_from_file
    @continent = Continent.new
    @country = Country.new
  end
end

world = World.new
puts "\n", world.max_population, "\n"
puts world.countries_inflation, "\n"
puts world.countries_continents, "\n"
