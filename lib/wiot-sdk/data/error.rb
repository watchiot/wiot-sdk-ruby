module WiotSdk
  module Data
    class Error
      def initialize(field, msg)
        @field = field
        @msg = msg
      end

      def field
        @field
      end

      def msg
        @msg
      end
    end
  end
end