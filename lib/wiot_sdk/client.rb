require 'wiot_sdk/request'
require 'wiot_sdk/response'

require 'wiot_sdk/config/parser_yml'
require 'wiot_sdk/config/parser_json'

module WiotSdk

  class Client

    def self.init_yaml(file_path)
      api_key, space, project = WiotSdk::ParserYml.parser file_path

      Request.new api_key, space, project
    end

    def self.init_json(file_path)
      api_key, space, project = WiotSdk::ParserJson.parser file_path

      Request.new api_key, space, project
    end

    def self.init(api_key, space, project)
      Request.new api_key, space, project
    end
  end

end
