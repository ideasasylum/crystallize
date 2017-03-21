require "ecr/macros"
require "html"
require "uri"
require "http"
require "markdown"

# A simple handler that lists directories and serves files under a given public directory.
class Crystallize::Preview::Handler
  include HTTP::Handler

  def initialize(@config : Crystallize::Config)
  end

  def call(context)
    unless context.request.method == "GET" || context.request.method == "HEAD"
      context.response.status_code = 405
      context.response.headers.add("Allow", "GET, HEAD")
      return
    end

    original_path = context.request.path.not_nil!
    is_dir_path = original_path.ends_with? "/"
    request_path = self.request_path(URI.unescape(original_path))

    # File path cannot contains '\0' (NUL) because all filesystem I know
    # don't accept '\0' character as file name.
    if request_path.includes? '\0'
      context.response.status_code = 400
      return
    end

    expanded_path = File.expand_path(request_path, "/")
    if is_dir_path && !expanded_path.ends_with? "/"
      expanded_path = "#{expanded_path}/"
    end
    is_dir_path = expanded_path.ends_with? "/"

    file_path = File.join(@config.source_dir, expanded_path)
    is_dir = Dir.exists? file_path

    if Dir.exists?(file_path)
      file_path = File.join(file_path, "index.html")
    end

    puts "#{original_path} => #{file_path}"
    if File.exists?(file_path)
      context.response.content_type = mime_type(file_path)
      context.response.content_length = File.size(file_path)
      File.open(file_path) do |file|
        IO.copy(file, context.response)
      end
    elsif File.exists?("#{file_path}.md")
      file_path = "#{file_path}.md"
      contents = File.read(file_path)
      rendered = Markdown.to_html contents

      context.response.content_type = "text/html"
      context.response.content_length = rendered.bytesize
      context.response.print rendered
    else
      context.response.status_code = 404
      return
    end
  end

  # given a full path of the request, returns the path
  # of the file that should be expanded at the public_dir
  protected def request_path(path : String) : String
    path
  end

  private def redirect_to(context, url)
    context.response.status_code = 302

    url = URI.escape(url) { |b| URI.unreserved?(b) || b != '/' }
    context.response.headers.add "Location", url
  end

  private def mime_type(path)
    case File.extname(path)
    when ".txt"          then "text/plain"
    when ".htm", ".html" then "text/html"
    when ".css"          then "text/css"
    when ".js"           then "application/javascript"
    else                      "application/octet-stream"
    end
  end
end
