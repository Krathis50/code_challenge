require "rails_helper"

describe CodeEvaluator do
  context "when given Ruby code" do
    context "with a challenge" do
      let(:challenge) { FactoryBot.create(:challenge) }
      let!(:problem_set_one) { FactoryBot.create(:problem_set, arguments: "1 2", answer: "3", challenge: challenge) }
      let!(:problem_set_two) { FactoryBot.create(:problem_set, arguments: "4 6", answer: "10", challenge: challenge) }
      let(:code) { "puts ARGV[0].to_i + ARGV[1].to_i" }

      it "verifies the code against the problem sets" do
        expect(CodeEvaluator.evaluate_for_challenge(language: :ruby, code: code, challenge: challenge)).to eq([true, true])
      end
    end

    context "without a challenge" do
      it "returns the correct answer for simple arithmetic" do
        expect(CodeEvaluator.evaluate_for(:ruby, "puts 1 + 1")).to eq(2.to_s)
      end

      it "returns the correct answer requiring a defined method" do
        code = %q{
      def method_being_called
        2
      end

      puts method_being_called
        }

        expect(CodeEvaluator.evaluate_for(:ruby, code)).to eq(2.to_s)
      end
    end
  end

  context "when given Python code" do
    it "returns the correct answer for simple arithmetic" do
      expect(CodeEvaluator.evaluate_for(:python, "print(1 + 1)")).to eq(2.to_s)
    end

    it "returns the correct answer requiring a defined method" do
      code = "def method_being_called():"\
      "    return 2"\
      "\n\nprint(method_being_called())"

      expect(CodeEvaluator.evaluate_for(:python, code)).to eq(2.to_s)
    end
  end
end
