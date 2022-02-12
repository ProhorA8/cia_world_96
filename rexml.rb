require "rexml/document"

module MyRexml
  # путь к файлу
  FILE_PATH = '/cia-1996.xml'

  def receipt_document
    current_path = File.dirname(__FILE__)
    file_name = current_path + FILE_PATH

    # прерываем выполнение программы досрочно, если файл не существует
    abort "Файл #{FILE_PATH} не найден." unless File.exist?(file_name)
    file = File.new(file_name)
    # создаём новый документ и анализируем предоставленный файл
    doc = REXML::Document.new file
    doc
  end

  # чтобы при повторном обращении не вычислять документ по новой (ускорение вычисления)
  def document
    @document ||= receipt_document 
  end
end
