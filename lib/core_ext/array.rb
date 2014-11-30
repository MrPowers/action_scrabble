class Array
  def duplicate_intersect?(arr)
    arr.all? do |l|
      arr.count(l) <= self.count(l)
    end
  end
end
