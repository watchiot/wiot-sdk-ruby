require 'wiot-sdk/request'
require 'wiot-sdk/response'

require 'wiot-sdk/config/parser_yml'
require 'wiot-sdk/config/parser_json'

module WiotSdk

  class Client

    def self.init_yaml(file_path, base_url)
      username, api_key, space, project = WiotSdk::Config::ParserYml.parser file_path

      Request.new username, api_key, space, project, base_url
    end

    def self.init_json(file_path, base_url)
      username, api_key, space, project = WiotSdk::Config::ParserJson.parser file_path

      Request.new username, api_key, space, project, base_url
    end

    def self.init(username, api_key, space, project, base_url)
      Request.new username, api_key, space, project, base_url
    end
  end

end
