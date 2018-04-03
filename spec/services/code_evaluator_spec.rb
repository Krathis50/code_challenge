require 'rails_helper'

describe CodeEvaluator do
  context 'when given Ruby code' do
    it 'returns the correct answer for simple arithmetic' do
      expect(CodeEvaluator.evaluate_for(:ruby, 'puts 1 + 1')).to eq(2.to_s)
    end

    it 'returns the correct answer requiring a defined method' do
      code = %q{
      def method_being_called
        2
      end

      puts method_being_called
      }

      expect(CodeEvaluator.evaluate_for(:ruby, code)).to eq(2.to_s)
    end
  end

  context 'when given Python code' do
    it 'returns the correct answer for simple arithmetic' do
      expect(CodeEvaluator.evaluate_for(:python, 'print(1 + 1)')).to eq(2.to_s)
    end

    it 'returns the correct answer requiring a defined method' do
      skip
      code = %q{
      def method_being_called():
          return 2

      print(method_being_called)
      }

      expect(CodeEvaluator.evaluate_for(:python, code)).to eq(2.to_s)
    end
  end
end
