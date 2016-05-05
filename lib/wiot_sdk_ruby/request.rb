require 'rest-client'
require 'json'

require_relative 'payload'
require_relative 'response'

module WiotSdkRuby
  class Request

    BASE_URL = 'http://api.watchiot.org/'

    def initialize(api_key, space, project)
      @api_key = api_key
      @space = space
      @project = project
    end

    def send(payload)
      uri = BASE_URL + @space + '/' + @project
      data = '{ api: ' + @api_key + ', data: { ' + JSON.generate(payload.values).to_s + '}'
      response = RestClient.post uri, data, content_type: 'json', accept: 'json'

      p response.code
      p response.body
    end
  end
end