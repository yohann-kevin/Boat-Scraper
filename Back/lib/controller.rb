require "tilt"
require "json"

require "./db/database"
require "./lib/yachts"

class Controller

  def not_found
    template = Tilt.new("./views/not_found.html.erb")
    [404, { "Content-Type" => "text/html" }, template.render]
  end

  def post_data
    db = Database.new
    initial_data = db.display_data
    all_yachts = []

    initial_data.each do |el|
      all_yachts << Yachts.new(el[0], el[1], el[2], el[3], el[4], el[5]).send_data
    end

    data = { "boats" => all_yachts }
    [200, { "Content-Type" => "application/json" }, data.to_json]
  end
end
