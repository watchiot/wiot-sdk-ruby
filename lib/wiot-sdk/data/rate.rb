module WiotSdk
  module Data
    class Rate
      def initialize(header)
        parser_rate header
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

      private

      def parser_rate(header)
        @rate_limit = ''
        @rate_remaining = ''
        @rate_reset = ''
      end
    end
  end
end