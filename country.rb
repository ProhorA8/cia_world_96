require_relative 'rexml'

class Country
  include MyRexml

  # возвращает страну с наибольшим населением
  def country_max_population
    hash = {}

    # используя метод модуля
    document.elements.each('*/country') do |country|
      # формируем хэш где ключ – число населения, значение – страна
      hash[country.attributes['population']] = country.attributes['name']
    end

    # берём числа населения, убираем nil, приводим к целочисленному значению, находим максимальное число
    max_population = hash.keys.compact.map(&:to_i).max

    # находим страну по максимальному числу населения
    country = hash[max_population.to_s]
    "#{country} – страна с максимальным числом населения"
  end

  # возвращает 5 стран с наибольшим уровнем инфляции – уровень
  def five_countries_highest_inflation
    hash = {}

    # используя метод модуля формируем хэш где ключ – инфляция, значение – страна
    document.elements.each('*/country') { |country| hash[country.attributes['inflation']] = country.attributes['name'] }

    # находим все значения инфляций, убрав nil
    array_all_inflations = hash.keys.compact.map(&:to_f)

    # находим максимальных 5 значений инфляции с плавающей точкой ["71.3", "83.3", "85", "94", "244"]
    five_max_inflation = array_all_inflations.sort.last(5).map { |inflation| inflation.to_s.gsub('.0', '') }

    # формируем массив – "страна – инфляция"
    five_max_inflation.map { |inflation| "#{hash[inflation]} – #{inflation}" }
  end
end
