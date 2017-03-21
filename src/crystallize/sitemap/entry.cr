struct Crystallize::Sitemap::Entry
  property path
  property file_path
  property processor
  property attributes

  def initialize(@path : String, @file_path : String, @processor : String, @attributes = {} of String => String)

  end

end
