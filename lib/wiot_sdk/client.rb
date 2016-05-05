require_relative 'request'
require_relative 'response'

module WiotSdk

  class Client

    def self.init_yaml(file_path)
      api_key = ''
      space = ''
      project = ''

      Request.new api_key, space, project
    end

    def self.init_json(file_path)
      api_key = ''
      space = ''
      project = '';

      Request.new api_key, space, project
    end

    def self.init(api_key, space, project)
      Request.new api_key, space, project
    end
  end

end
