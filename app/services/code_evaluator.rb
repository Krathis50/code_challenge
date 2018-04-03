class CodeEvaluator
  EVALUATOR_CLASSES = {
    ruby: Evaluators::RubyEvaluator,
  }

  def self.evaluate_for(language, code)
    EVALUATOR_CLASSES[language].new(code).evaluate
  end
end
