class MemoryNameRepository
  def initialize(names = [], used_names = [])
    @names = names
    @used_names = used_names
  end

  def all
    @names
  end

  def used
    @used_names
  end

  def add_used(name)
    @used_names << name
  end
end
