require "file_utils"

class Crystallize::Processors::Base

  def initialize(@entry : Crystallize::Sitemap::Entry)
  end

  def process
  end
end
