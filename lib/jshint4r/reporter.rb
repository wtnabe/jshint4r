module JSHint4r
  class << self
    def reporter( reporter = :text )
      JSHint4r::Reporter.const_get( reporter.to_s.capitalize ).new
    end
  end

  module Reporter
    #
    # [param]  Hash error
    # [return] Hash
    #
    def key_symbolize( error )
      Hash[*error.map { |k, v|
        [k.to_sym, v]
      }.flatten]
    end
  end
end
