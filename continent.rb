require_relative 'rexml'

class Continent
  include MyRexml

  # возвращает в алфавитном порядке континенты и страны, принадлежащие им
  def countries
    hash = {}

    continents.each do |continent| 
      hash["#{continent}"] = []

      document.elements.each('*/country') do |country|
        # если континент страны соответствует переданому континенту,
        # то добавляем имя страны в хэш для ключа этого континента
        if country.attributes['continent'] == continent
          hash["#{continent}"] << country.attributes['name']
        end
      end
    end

    hash.map { |key, value| "#{key} – #{value.join(', ')}" }
  end

  private

  # возвращает массив континентов
  def continents
    arr_continents = []
    # используя метод модуля находим континенты в файле и передаём каждый в массив
    document.elements.each('*/continent') { |continent| arr_continents << continent.attributes['name'] }
    # получаем континенты в алфавитном порядке
    arr_continents.sort
  end
end
