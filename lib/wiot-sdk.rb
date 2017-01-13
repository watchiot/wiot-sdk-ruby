require 'wiot-sdk/client'
require 'wiot-sdk/metric'
require 'wiot-sdk/version'

module WiotSdk

  def self.init(api_key, space, project)
    Client.init api_key, space, project
  end

  def self.init_yaml(file_path)
    Client.init_yaml file_path
  end

  def self.init_json(file_path)
    Client.init_json file_path
  end

end
