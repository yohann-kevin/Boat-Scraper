require "nokogiri"
require "open-uri"
require "pry"
require "./db/database"
require "./lib/yachts_sanitizer"

url = "https://greta-code-pizza.github.io/topsails/"
html = URI.open(url)
app = Nokogiri::HTML(html)

all_price = app.css(".price").map(&:text)
all_price << app.css(".offer").text
all_title = app.css(".card-title").collect(&:text)

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

all_data = [all_title, all_price, all_years, all_length, all_width, all_state]

yacht_sanitizer = YachtSanitizer.new(all_data)
yacht_sanitizer.check_data
