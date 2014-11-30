module ActionScrabble
  class Words

    def self.all
      @words ||= File.readlines(PROJECT_ROOT + "/lib/words.txt").map do |w|
        w.chomp
      end
    end

  end
end

