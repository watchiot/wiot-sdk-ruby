require 'rest-client'
require 'json'

require_relative 'payload'
require_relative 'response'

module WiotSdk

  class Request

    def initialize(username, api_key, space, project, base_url)
      @username = username
      @api_key = api_key
      @uri = base_url + '/' + space + '/' + project
    end

    def send(payload)
      response = RestClient.post url, payload.to_s,
                                 Authorization: "#{@username} #{@api_key}",
                                 content_type: 'json',
                                 accept: 'json'

      Response.new response
    rescue => ex
      Response.new ex.response
    end

  end
end
