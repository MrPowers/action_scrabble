module ActionScrabble
  class WordPicker

    attr_reader :letters, :filters

    def initialize(letters, filters = [])
      @letters = letters
      @filters = filters
    end

    def filtered_words
      words.select do |word|
        analyzer = WordAnalyzer.new(word, letters)
        analyzer.included? &&
        filters.all? { |f| f.call(word) }
      end
    end

    def words_with_points
      descending = -1
      filtered_words.map do |w|
        [w, points(w)]
      end.sort_by do |_, points|
        points * descending
      end
    end

    private

    def words
      Words.all
    end

  end
end

