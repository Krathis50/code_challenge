module Evaluators
  class PythonEvaluator < Evaluators::BaseEvaluator
    def evaluate
      program = `python3 -c '#{ code }'`
      program.strip
    end
  end
end
