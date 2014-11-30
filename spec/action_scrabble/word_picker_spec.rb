require "spec_helper"

module ActionScrabble
  describe WordPicker do

    context "#possible_words" do
      it "returns the words that can be made up from %w|q a f t|" do
        picker = WordPicker.new(%w|q a f t|)
        expected = ["aft", "at", "fa", "fat", "qat", "ta"]
        expect(picker.possible_words).to eq expected
      end

      it "finds words that have 'a' as the second letter" do
        p = Proc.new {|w| w[1] == "a"}
        picker = WordPicker.new(%w|q a f t|, [p])
        expected = ["fa", "fat", "qat", "ta"]
        expect(picker.possible_words).to eq expected
      end

      it "finds words that end with 't'" do
        p = Proc.new {|w| w.end_with? "t"}
        picker = WordPicker.new(%w|q a f t|, [p])
        expected = ["aft", "at", "fat", "qat"]
        expect(picker.possible_words).to eq expected
      end

      it "allows multiple filters to be applied" do
        p1 = Proc.new {|w| w.end_with? "t"}
        p2 = Proc.new {|w| w[1] == "a"}
        picker = WordPicker.new(%w|q a f t|, [p1, p2])
        expected = ["fat", "qat"]
        expect(picker.possible_words).to eq expected

      end
    end

  end
end

