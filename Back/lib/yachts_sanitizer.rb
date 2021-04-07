require "./db/database"

class YachtSanitizer
  def initialize(data)
    @db = Database.new
    @data = data
  end

  def check_data
    transform_data if check_type_data && check_size_data
  end

  def check_type_data
    @data.each do |el|
      return false if el.class != Array
    end
    true
  end

  def check_size_data
    return false if @data.length != 6

    @data.each do |el|
      return false if el.length != 8
    end
    true
  end

  def transform_data
    i = 0
    while i < @data[0].length
      begin
        @data[1][i] = format_price(@data[1][i])
        @data[2][i] = @data[2][i].to_i
        @data[3][i] = format_width_and_length(@data[3][i])
        @data[4][i] = format_width_and_length(@data[4][i])
        final_data = hash_data(@data[0][i], @data[1][i], @data[2][i], [@data[3][i], @data[4][i]], @data[5][i])
        @db.add_data(final_data)
      rescue StandardError => e
        puts e
        return false
      end
      i += 1
    end
    @db.display_data
  end

  def format_price(price)
    price.tr("€htc ", "").to_i
  end

  def format_width_and_length(value)
    value.tr("m ", "").to_f
  end

  def hash_data(name, price, boat_year, size, state)
    {
      "name" => name,
      "price" => price,
      "boat_year" => boat_year,
      "length" => size[0],
      "width" => size[1],
      "state" => state
    }
  end
end
