module WiotSdk

  class Metric
    def initialize
      @metric = {}
    end

    def add(key, value)
      @metric[key] = value
    end

    def values
      @metric
    end
  end

end
