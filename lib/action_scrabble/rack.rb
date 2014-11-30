module ActionScrabble
  class Rack

    attr_reader :tiles

    def initialize(tiles)
      @tiles = tiles
    end

    def letters
      tiles.map(&:letter)
    end

  end
end
