module Evaluators
  class BaseEvaluator
    attr_reader :code

    def initialize(code)
      @code = code
    end

    def evaluate
      raise NotImplementedError, "Subclass must implement"
    end
  end
end
