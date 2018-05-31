module Evaluators
  class BaseEvaluator
    attr_reader :code, :arguments

    def initialize(code, arguments: nil)
      @code = code
      @arguments = arguments
    end

    def evaluate
      raise NotImplementedError, "Subclass must implement"
    end
  end
end
