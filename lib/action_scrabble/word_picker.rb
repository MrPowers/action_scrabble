module ActionScrabble
  class WordPicker

    attr_reader :letters, :filters

    def initialize(letters, filters = [])
      @letters = letters
      @filters = filters
    end

    def filtered_words
      words.select do |word|
        letters.duplicate_intersect?(word.split("")) &&
        filters.all? { |f| f.call(word) }
      end
    end

    def words_with_points
      filtered_words.map do |w|
        [w, points(w)]
      end.sort_by do |w, p|
        p * -1
      end
    end

    private

    def words
      Words.all
    end

    def points(word)
      word.split("").inject(0) do |sum, letter|
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

