class CodeEvaluator
  def initialize(language, code)
    @language = language
    @code = code
  end

  def evaluate
    program = `ruby -e 'method = lambda { #{ @code } }; puts method.call'`
    program.strip
  end
end
