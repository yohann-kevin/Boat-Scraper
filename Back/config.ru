require "rack"
require "thin"
require "pry"
load "router.rb"

handler = Rack::Handler::Thin
handler.run(
  Router.new,
  Port: 7373
)
