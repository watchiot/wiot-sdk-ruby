require 'wiot-sdk/rate_limit'

module WiotSdk

  class Response
    def initialize(response)
      @code = response.code

      @msg  = response.msg if @code != 200
      @error = response.error if @code != 200

      @rate_limit = WiotSdk::RateLimit.new response.headers
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
