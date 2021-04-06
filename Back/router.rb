require "./lib/controller"

class Router
  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    roots(path)
  end

  def roots(path)
    case path
    when "/"
      controller.post_data
    else
      controller.not_found
    end
  end
end
