require "file_utils"

class Crystallize::Processor
  STATIC_DIRS = ["images", "javascripts", "stylesheets"]

  def initialize
    @source_dir = "source"
    @dest_dir = "build"
    FileUtils.mkdir(@dest_dir) unless Dir.exists?(@dest_dir)
    Crystallize::Sitemap::Generator.new
  end

end
