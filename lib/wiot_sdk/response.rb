require 'wiot_sdk/response/errors'
require 'wiot_sdk/response/rate'

module WiotSdk

  class Response
    def initialize(response, code = nil, message = nil)
      @code = code || response.code
      @rate = Rate.new response.headers

      @message = message || parser_message(response.body)
      @errors = Errors.new response.body
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
