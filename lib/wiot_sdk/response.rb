module WiotSdk

  class Response
    def initialize(code, attempts=0, msg='')
      @code = code
      @attempts = attempts
      @msg = msg
    end

    def code
      @code
    end

    def attempts
      @attempts
    end

    def msg
      @msg
    end
  end
end
