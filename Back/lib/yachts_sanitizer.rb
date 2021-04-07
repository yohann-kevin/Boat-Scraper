require "./db/database"

class YachtSanitizer
  def initialize(data)
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
    data = Database.new
    data.remove_last_data
    i = 0
    while i < @data[0].length
      @data[1][i] = @data[1][i].tr("€htc ","").to_i
      @data[2][i] = @data[2][i].to_i
      @data[3][i] = @data[3][i].tr("m ","").to_f
      @data[4][i] = @data[4][i].tr("m ","").to_f
      data.add_data(@data[0][i], @data[1][i], @data[2][i], @data[3][i], @data[4][i], @data[5][i])
      i += 1
    end
    data.display_data
  end
end
