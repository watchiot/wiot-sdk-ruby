require 'wiot-sdk/request'
require 'wiot-sdk/response'

require 'wiot-sdk/config/parser_yml'
require 'wiot-sdk/config/parser_json'

module WiotSdk

  class Client

    def self.init_yaml(file_path)
      api_key, space, project = WiotSdk::Config::ParserYml.parser file_path

      Request.new api_key, space, project
    end

    def self.init_json(file_path)
      api_key, space, project = WiotSdk::Config::ParserJson.parser file_path

      Request.new api_key, space, project
    end

    def self.init(api_key, space, project)
      Request.new api_key, space, project
    end
  end

end
