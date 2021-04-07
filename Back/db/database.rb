require "sqlite3"

class Database
  def initialize
    @db = SQLite3::Database.open "./db/topsails.db"
  end

  def remove_last_data
    @db.execute "DELETE FROM Yachts"
  end

  def add_data(name, price, year, length, width, state)
    @db.execute "INSERT OR IGNORE INTO Yachts(name, price, boat_year, length, width, state) VALUES('#{name}', #{price}, #{year}, #{length}, #{width}, '#{state}')"
  end

  def display_data
    data = @db.execute "SELECT * FROM Yachts"
    puts data
    return data
  end
end
