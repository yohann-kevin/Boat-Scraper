require "sqlite3"

class Database
  def initialize
    @db = SQLite3::Database.open "./db/topsails.db"
  end

  def remove_last_data
    @db.execute "DELETE FROM Yachts"
  end

  def add_data(data)
    @db.execute("INSERT OR IGNORE INTO Yachts VALUES(:name, :price, :boat_year, :length, :width, :state)", data)
  end

  def display_data
    data = @db.execute "SELECT * FROM Yachts"
    puts data
    data
  end
end
