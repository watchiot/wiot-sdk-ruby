require 'json'
require 'wiot-sdk/rate_limit'

module WiotSdk

  class Response
    def initialize(response)
      @rate_limit = WiotSdk::RateLimit.new response.headers

      response = JSON.parse(JSON.parse(response, :quirks_mode => true))

      @code   = response['code']
      @msg    = response['msg']
      @error  = response['error'] || nil
    end

    def code
      @code
    end

    def rate_limit
      @rate_limit
    end

    def msg
      @msg
    end

    def error
      @error
    end
  end

end
