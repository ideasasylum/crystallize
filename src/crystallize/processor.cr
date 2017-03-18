require "file_utils"

class Crystallize::Processor
  STATIC_DIRS = ["images", "javascripts", "stylesheets"]

  def initialize
    @source_dir = "source"
    @dest_dir = "build"
    FileUtils.mkdir(@dest_dir) unless Dir.exists?(@dest_dir)
  end

  def find_files
    # Find all the files: *.html.erc, *.xml.builder, *.md
    Dir.glob("#{@source_dir}/**/*.html", "#{@source_dir}/**/*.html.ecr", "#{@source_dir}/**/*.xml.builder", "#{@source_dir}/**/*.md") do |f|
      puts f
      case f
      when /^.*\.html$/
        puts "html"
      when /^.*\.ecr$/
        puts "ecr"
      when /^.*\.md$/
        puts "markdown"
        Crystallize::MarkdownProcessor.new(f).process
      end
    end
  end

  def copy_static_files
    STATIC_DIRS.each { |subdir| copy_subdir(subdir) }
  end

  def copy_subdir(subdir : String)
    # Ensure the source directory exists
    source = File.join(@source_dir, subdir)
    return unless Dir.exists?(source)

    # Make the destination directory, if necessary
    dest = File.join(@dest_dir, subdir)
    FileUtils.mkdir(dest) unless Dir.exists?(dest)

    # Copy the files
    FileUtils.cp_r(source, dest)
  end
end
