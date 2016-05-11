require 'wiot_sdk/response/errors'
require 'wiot_sdk/response/rate'

module WiotSdk

  class Response
    def initialize(response)
      @code = response.code
      @rate = Rate.new response.headers

      @message = parser_message response.body
      @errors = Errors.new response.body
    end

    def initialize(code, message)
      @code = code
      @message = message
    end

    def code
      @code
    end

    def rate
      @rate
    end

    def message
      @message
    end

    def errors
      @errors
    end

    def has_errors?
      !@errors.nil? && @errors.has_errors?
    end

    private

    def parser_message(body)
      body
    end
  end
end
