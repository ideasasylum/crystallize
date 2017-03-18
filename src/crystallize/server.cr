require "http/server"

class Crystallize::Server
  def initialize(host : String, port : Int32)
    @host = host
    @port = port
  end

  def start
    server = HTTP::Server.new(@host, @port, [Crystallize::Handler.new])
    puts "Listening on http://#{@host}:#{@port}"
    server.listen
  end
end
