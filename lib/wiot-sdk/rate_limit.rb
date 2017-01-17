module WiotSdk
    class RateLimit
      def initialize(headers)
        @rate_limit = headers[:x_ratelimit_limit]
        @rate_remaining = headers[:x_ratelimit_remaining]
        @rate_reset = headers[:x_ratelimit_reset]
      end

      def rate_limit
        @rate_limit
      end

      def rate_remaining
        @rate_remaining
      end

      def rate_reset
        @rate_reset
      end

    end
end