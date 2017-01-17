require 'rest-client'
require 'json'

require_relative 'payload'
require_relative 'response'

module WiotSdk

  class Request

    def initialize(username, api_key, space, project, base_url)
      @username = username
      @api_key = api_key
      @space = space
      @project = project
      @base_url = base_url
    end

    def send(payload)
      uri = @base_url + '/' + @space + '/' + @project

      req uri, payload.to_s
    rescue => ex
      Response.new ex.response
    end

    private

    def req(url, payload)
      response = RestClient.post url, payload,
                                 Authorization: "#{@username} #{@api_key}",
                                 content_type: 'json',
                                 accept: 'json'

      Response.new response
    end
  end

end
