require "../../spec_helper"

describe Crystallize::Sitemap::Generator do
  # TODO: Write tests

  describe "output_path" do
    it "trims the last file type" do
      f = "source/folder/file.html.md"
      Crystallize::Sitemap::Generator.new.output_path(f).should eq("source/folder/file.html")
    end
  end
end
