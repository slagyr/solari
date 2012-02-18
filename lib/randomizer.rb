class Randomizer
  attr_reader :names, :used_names

  def initialize(name_repository, persist_used_names)
    @name_repository = name_repository
    @persist_used_names = persist_used_names
    @used_names = []
  end

  def load_names
    @names = @name_repository.all
    if @persist_used_names
      @used_names = @name_repository.used
    end
  end

  def save_used_name name
    @used_names << name
    if @persist_used_names
      @name_repository.add_used name
    end
  end

  def available_names
    return randomize(@names - @used_names)
  end

  def select_name
    possible_names = available_names
    index = rand possible_names.size
    name = possible_names[index]
    save_used_name name
    return name
  end

  private

  def randomize(array)
    new_array = []
    array.size.downto(1) { |n| new_array.push array.delete_at(rand(n)) }
    new_array
  end

end
