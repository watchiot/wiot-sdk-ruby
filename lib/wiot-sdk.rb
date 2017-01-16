require 'wiot-sdk/client'
require 'wiot-sdk/payload'
require 'wiot-sdk/version'

module WiotSdk

  DEFAULT_BASE_URL = 'http://api.watchiot.com'

  def self.init(username:, api_key:, space:, project:, base_url: DEFAULT_BASE_URL)
    Client.init username, api_key, space, project, base_url
  end

  def self.init_yaml(file_path:, base_url: DEFAULT_BASE_URL)
    Client.init_yaml file_path, base_url
  end

  def self.init_json(file_path:, base_url: DEFAULT_BASE_URL)
    Client.init_json file_path, base_url
  end

end
