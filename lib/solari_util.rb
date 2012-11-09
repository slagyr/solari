module SolariUtil
  def self.max
    13
  end

  def self.pad name
    return name[0...self.max] if name.size > self.max
    padding = (self.max - name.size) / 2
    return (" " * (self.max - name.size - padding)) + name + (" " * padding)
  end
end
