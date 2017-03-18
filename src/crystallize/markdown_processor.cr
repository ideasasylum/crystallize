require "file_utils"
require "markdown"

class Crystallize::MarkdownProcessor < Crystallize::FileProcessor

  def initialize(file_path : String)
    super
    @file_path = file_path
  end

  def process
    contents = File.read(@file_path)
    rendered = Markdown.to_html contents
    puts @file_path
    matches = @file_path.match(/^source\/(.*)\.md$/)
    if matches
      dest_file = "build/#{matches[1]}"
      puts dest_file
      File.write(dest_file, rendered)
    end
  end

end
