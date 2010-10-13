class Randomizer
  attr_reader :names, :used_names

  def self.data_home
    @data_home
  end

  def self.data_home=(dir)
    @data_home = dir
  end

  def initialize
    @used_names = []
  end

  def names_file
    File.join(Randomizer.data_home, "solari.all")
  end

  def used_file
    File.join(Randomizer.data_home, "solari.used")
  end

  def load_names
    @names = IO.read(names_file).split("\n")
    @used_names = IO.read(used_file).split("\n")
  end

  def save_used_name name
    @used_names << name
    File.open(used_file, 'a') { |f| f.write "#{name}\n"}
  end

  def available_names
    return @names - @used_names
  end

  def select_name
    possible_names = available_names
    index = rand possible_names.size
    name = possible_names[index]
    save_used_name name
    return name
  end
end

Randomizer.data_home = File.expand_path("~")