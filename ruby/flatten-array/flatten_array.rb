class FlattenArray
  def self.flatten(list)
    list.flatten.reject(&:nil?)
  end
end
