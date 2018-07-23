require 'rexml/document'
require 'csv'

Dir.glob("20180607/*.xml").each do |file_path|
  xml = REXML::Document.new(File.open(file_path))
  fund_code = xml.elements['//fund']["code"]
  fund_name = xml.elements['//fund']["name"]
  csv_name = "#{fund_code}_#{fund_name}.csv".gsub(/[?"\\\<>*|\/]/,"_")

  CSV.open("20180607/csv/#{csv_name}", "wb") do |csv|
    attributes = ["price", "volume", "return_value", "indication"]
    csv << ["Date"] + attributes
    xml.elements.each('//day') do |element|
      date = "#{element["year"]}/#{element["month"]}/#{element["value"]}"
      csv << [date] + attributes.map{|att| element[att]}
    end
  end
end
