require "yaml"

class Crystallize::Config

  YAML.mapping(
      source_dir: { type: String, default: "source" },
      dest_dir: { type: String, default: "build" },
      data_dir: { type: String, default: "data" },
      host:  { type: String, default: "localhost" },
      port:  { type: Int32, default: 8080 },
    )

  def self.read
    raise "config.yaml not found" unless File.exists?("config.yaml")
    from_yaml(File.read("./config.yaml"))
  end

end
