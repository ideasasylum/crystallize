class Crystallize::Sitemap::Generator

  def initialize
    @sitemap = Crystallize::Sitemap::Store
  end

  def generate
    # for every file
    # create a sitemap entry
  end

  def find_files
    # Find all the files in the source directory
    Dir.glob("#{@source_dir}/**/*") do |f|
      puts f
      entry = Crystallize::Sitemap::Entry.new output_path, f, processor,
      processor = "copy"

      entry = case f
      when /^.*\.ecr$/
        ecr_entry(f)
      when /^.*\.md$/
        markdown_entry(f)
      else
        static_entry(f)
      end
      @sitemap << entry
    end
  end

  def static_entry(f : String)
    puts "static file"
    Crystallize::Sitemap::Entry.new f, f, "copy"
  end

  def markdown_entry(f : String)
    puts "markdown"
    Crystallize::Sitemap::Entry.new output_path(f), f, "markdown"
  end

  def ecr_entry(f : String)
    puts "ecr"
    Crystallize::Sitemap::Entry.new output_path(f), f, "ecr"
  end

  def output_path(f : String)
    f.match(/^(.+)\.(.+)$/).try &.[1] || ""
  end
end
