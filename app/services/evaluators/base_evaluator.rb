module Evaluators
  class BaseEvaluator
    attr_reader :code, :arguments

    def initialize(code, args)
      @code = code
      @arguments = args
    end

    def evaluate
      raise NotImplementedError, "Subclass must implement"
    end
  end
end
