require "http/server"

class Crystallize::Preview::Server
  def initialize(@config : Crystallize::Config)
  end

  def start
    server = HTTP::Server.new(@config.host, @config.port, [Crystallize::Preview::Handler.new(@config)])
    puts "Listening on http://#{@config.host}:#{@config.port}"
    server.listen
  end
end
