module Evaluators
  class RubyEvaluator < Evaluators::BaseEvaluator
    def evaluate
      program = `ruby -e 'method = lambda { #{ @code } }; method.call'`
      program.strip
    end
  end
end
