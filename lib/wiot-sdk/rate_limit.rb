module WiotSdk
    class RateLimit

      def initialize(headers)
        @rate = {
          limit:        headers[:x_ratelimit_limit],
          remaining:    headers[:x_ratelimit_remaining],
          reset:        headers[:x_ratelimit_reset],
          retry_after:  headers[:x_retry_after] || nil
        }
      end

      def limit
        @rate[:limit]
      end

      def remaining
        @rate[:remaining]
      end

      def reset
        @rate[:reset]
      end

      def retry_after
        @rate[:retry_after]
      end
    end
end