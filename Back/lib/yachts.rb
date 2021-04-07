class Yachts
  def initialize(name, price, year, length, width, state)
    @name = name
    @price = price
    @year = year
    @length = length
    @width = width
    @state = state
  end

  def send_data
    {
      "name" => @name,
      "price" => @price,
      "year" => @year,
      "length" => @length,
      "width" => @width,
      "state" => @state
    }
  end
end
