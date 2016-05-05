module WiotSdkRuby
  class Payload
    def initialize
      @payload = {}
    end

    def add(key, value)
      @payload[key] = value
    end

    def values
      @payload
    end
  end
end