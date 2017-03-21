class Crystallize::Sitemap::Store
  @source_lookup = {} of String => Entry
  @dest_lookup = {} of String => Entry

  def initialize
  end

  def << (entry : Entry)
    @source_lookup[entry.file_path] = entry
    @dest_lookup[entry.path] = entry
  end
end
