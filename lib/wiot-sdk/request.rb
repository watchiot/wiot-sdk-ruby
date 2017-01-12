require 'rest-client'
require 'json'

require_relative 'metric'
require_relative 'response'

module WiotSdk

  class Request

    BASE_URL = 'http://api.watchiot.org/'

    def initialize(api_key, space, project)
      @api_key = api_key
      @space = space
      @project = project
    end

    def send(metric)
      uri = BASE_URL + @space + '/' + @project
      payload = '{ api: ' + @api_key + ', data: { ' + JSON.generate(metric.values).to_s + '}'

      req uri, payload
    rescue => ex
      Response.new nil, 500, ex.message
    end

    private

    def req(url, payload)
      response = RestClient.post url, payload, content_type: 'json', accept: 'json'

      Response.new response
    end
  end

end
