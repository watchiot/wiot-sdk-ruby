module WiotSdk

  class Payload
    def initialize
      @metric = {}
    end

    def addMetric(key, value)
      @metric[key] = value
    end

    def values
      @metric
    end


  end

end
