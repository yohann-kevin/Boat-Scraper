require "nokogiri"
require "open-uri"
require "pry"
require "./db/database"

url = "https://greta-code-pizza.github.io/topsails/"
html = URI.open(url)
app = Nokogiri::HTML(html)

title = app.css("#fast h4").children.text
price = app.css("#fast .price").children.text

all_price = app.css(".price").map(&:text)
all_price << app.css(".offer").text
all_title = app.css('.card-title').collect{|node| node.text}

all_years = app.css(".card .badge-danger").map(&:text)
all_state = app.css(".card-text").map(&:text)

all_property = app.css(".card-body").collect { |card| card }
all_length = []
all_width = []

i = 0
while i < all_property.length
  all_length << all_property[i].children[7].children[3].text
  all_width << all_property[i].children[9].children[3].text
  i += 1
end

puts "all_price #{all_price}"
puts "all_title #{all_title}"

data = Database.new
data.remove_last_data

i = 0
while i < all_price.length
  all_price[i] = all_price[i].tr("€htc ","").to_i
  all_length[i] = all_length[i].tr("m ","").to_f
  all_width[i] = all_width[i].tr("m ","").to_f
  all_years[i] = all_years[i].to_i
  data.add_data(all_title[i], all_price[i], all_years[i], all_length[i], all_width[i], all_state[i])
  i += 1
end

data.display_data
