require 'yaml'

class Config
  def initialize(path)
    if(File.exist?(path))

      file = YAML.load_file(path)
      file.each do |attr, value|
        define_singleton_method("#{attr}=") { |val|file[attr] = val }
        define_singleton_method(attr) { file[attr] }
      end

    else

      raise 'Config file not found: ' + path

    end
  end
end
