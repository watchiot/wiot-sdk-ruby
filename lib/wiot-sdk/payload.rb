require 'json'

module WiotSdk

  class Payload
    def initialize
      @metric = {}
    end

    def addMetric(key, value)
      @metric[key] = value
    end

    def to_s
      payload = { metrics: @metric }
      payload.to_json
    end
  end

end
