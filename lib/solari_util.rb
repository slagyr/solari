module SolariUtil
  def self.pad name
    max = 10
    return name[0...max] if name.size > max
    padding = (max - name.size) / 2
    return (" " * (max - name.size - padding)) + name + (" " * padding) 
  end
end