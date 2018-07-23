require 'yaml'

source_html = File.read("fnc_list.html")
regexp = /\<td\>\<a href\=\"SnapShot\.do\?fnc\=(\d+)\" target\=\"\_blank\" \>(.*?)\<\/a\>\<\/td\>/
data = {}
source_html.split(/[\r\n]/).each do |line|
  if line =~ regexp
    data[$1] = $2
  end
end

YAML.dump(data, File.open('list.yml', 'w'))
