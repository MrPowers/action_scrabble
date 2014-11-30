require "spec_helper"

module ActionScrabble
  describe WordAnalyzer do

    context "#included" do
      it "returns true when a word is included" do
        analyzer = WordAnalyzer.new("dog", "godat")
        expect(analyzer.included?).to be_truthy
      end

      it "returns false when a word isn't included" do
        analyzer = WordAnalyzer.new("foo", "nice")
        expect(analyzer.included?).to be_falsey
      end

      it "returns false when a duplicate letter isn't included" do
        analyzer = WordAnalyzer.new("dogg", "afgod")
        expect(analyzer.included?).to be_falsey
      end

      it "returns true when a wildcard can be used to make the word" do
        analyzer = WordAnalyzer.new("dogg", "?afgod")
        expect(analyzer.included?).to be_truthy
      end
    end

  end
end


