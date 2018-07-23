require 'yaml'

folder_name = Time.now.strftime("%Y%m%d")
list = YAML.load_file("list.yml")

list.each do |key, name|
  `wget http://www.morningstar.co.jp/FundData/common/chart/xml/all/#{key}.xml`
  sleep 5
end
