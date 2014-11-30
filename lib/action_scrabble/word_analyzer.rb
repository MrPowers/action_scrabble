module ActionScrabble
  class WordAnalyzer

    attr_reader :word, :letters

    def initialize(word, letters)
      @word = word
      @letters = letters
    end

    def included?
      missing_from_letters.length <= wildcard_count
    end

    private

    # what's in the word, but not in letters
    # using #chars instead of split because it's a lot faster
    def missing_from_letters
      word.chars.uniq.inject("") do |memo, l|
        difference = word.count(l) - letters.count(l)
        if difference > 0
          memo += l * difference
        end
        memo
      end
    end

    def wildcard_count
      letters.count("?")
    end

    def points
      word.chars("").inject(0) do |sum, letter|
        sum += mapping[letter.upcase]
        sum
      end
    end

    def mapping
      {
        "A" => 1,
        "E" => 1,
        "I" => 1,
        "O" => 1,
        "N" => 1,
        "R" => 1,
        "T" => 1,
        "L" => 1,
        "S" => 1,
        "U" => 1,
        "D" => 2,
        "G" => 2,
        "B" => 3,
        "C" => 3,
        "M" => 3,
        "P" => 3,
        "F" => 4,
        "H" => 4,
        "V" => 4,
        "W" => 4,
        "Y" => 4,
        "K" => 5,
        "J" => 8,
        "X" => 8,
        "Q" => 10,
        "Z" => 10,
      }
    end

  end
end

