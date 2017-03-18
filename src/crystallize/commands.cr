require "option_parser"

if ARGV.size == 0
  puts "Usage: crystallize [build | server]"
  exit -1
end

case ARGV[0]
when "server"
  server
when "build"
  build
end

def server
  host = "127.0.0.1"
  port = 8080

  OptionParser.parse(ARGV[1..-1]) do |parser|
    parser.banner = "Usage: crystallize server"
    parser.on("-p PORT", "--port=PORT", "the port to use") { |p| port = p.to_i32 }
    parser.on("-h HOST", "--host=HOST", "Specifies the host to use") { |h| host = h }
    parser.on("-h", "--help", "Show this help") { puts parser }
  end
  Crystallize::Server.new(host, port).start
end

def build
  processor = Crystallize::Processor.new
  processor.copy_static_files
  processor.find_files
end
