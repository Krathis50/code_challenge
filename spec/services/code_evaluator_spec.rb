require 'rails_helper'

describe CodeEvaluator do
  context 'when given Ruby code' do
    it 'returns the correct answer for simple arithmetic' do
      expect(CodeEvaluator.new(:ruby, '1 + 1').evaluate).to eq(2.to_s)
    end

    it 'returns the correct answer requiring a defined method' do
      code = %q{
      def method_being_called
        2
      end

      method_being_called
      }

      expect(CodeEvaluator.new(:ruby, code).evaluate).to eq(2.to_s)
    end
  end
end
