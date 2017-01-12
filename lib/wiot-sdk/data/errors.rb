module WiotSdk
  module Data
    class Errors
      def initialize(body)
        @errors = parser_errors body
      end

      def errors
        @errors
      end

      def has_errors?
        !@errors.nil? && @errors.size > 0
      end

      private

      def parser_errors(body)
        []
      end
    end
  end
end