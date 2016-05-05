require 'wiot_sdk_ruby/version'
require 'wiot_sdk_ruby/client'

module WiotSdkRuby

  def self.init(api_key, space, project)
    Config.init api_key, space, project
  end

  def self.init_yaml(file_path)
    Config.init_yaml file_path
  end

  def self.init_json(file_path)
    Config.init_json file_path
  end

end
