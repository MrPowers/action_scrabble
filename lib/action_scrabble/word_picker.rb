module ActionScrabble
  class WordPicker

    attr_reader :letters, :filters

    def initialize(letters, filters = [])
      @letters = letters
      @filters = filters
    end

    def possible_words
      words.select do |word|
        letters.duplicate_intersect?(word.split("")) &&
        filters.all? { |f| f.call(word) }
      end
    end

    private

    def words
      Words.all
    end

  end
end

