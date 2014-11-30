require "spec_helper"

module ActionScrabble
  describe Rack do
    context "#letters" do
      it "returns an array of the letters in the tiles" do
        t1 = Tile.new("A")
        t2 = Tile.new("B")
        rack = Rack.new([t1, t2])
        expect(rack.letters).to eq ["A", "B"]
      end
    end
  end
end
