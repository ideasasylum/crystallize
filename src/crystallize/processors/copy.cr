require "file_utils"
require "markdown"

class Crystallize::Processors::MarkdownProcessor < Crystallize::Processors::Base

  def initialize(entry : Crystallize::Sitemap::Entry)
    super
    @file_path = file_path
  end

  def process
    # TODO: Copy the file
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
