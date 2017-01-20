require 'json'

module WiotSdk

  class Response
    def initialize(response)
      @rate_limit = parse_rate response.headers

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

    private

    def parse_rate(headers)
      {
          limit:        headers[:x_ratelimit_limit],
          remaining:    headers[:x_ratelimit_remaining],
          reset:        headers[:x_ratelimit_reset],
          retry_after:  headers[:x_retry_after] || nil
      }
    end
  end

end
