class CodeEvaluator
  EVALUATOR_CLASSES = {
    ruby: Evaluators::RubyEvaluator,
    python: Evaluators::PythonEvaluator,
  }

  def self.evaluate_for(language, code)
    EVALUATOR_CLASSES[language].new(code).evaluate
  end

  def self.evaluate_for_challenge(challenge:, language:, code:)
    evaluator = EVALUATOR_CLASSES[language]

    challenge.problem_sets.map do |problem_set|
      answer = problem_set.answer == evaluator.new(code, arguments: problem_set.arguments).evaluate
      answer
    end
  end
end
