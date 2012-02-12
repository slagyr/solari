require 'fileutils'

class Randomizer
  attr_reader :names, :used_names

  def initialize(data_home, persist_used_names)
    @data_home = data_home
    @persist_used_names = persist_used_names
    @used_names = []
  end

  def names_file
    file = File.join(@data_home, "solari.all")
    create_unless_exists(file)
    file
  end

  def used_file
    file = File.join(@data_home, "solari.used")
    create_unless_exists(file)
    file
  end

  def load_names
    @names = IO.read(names_file).split("\n")
    if @persist_used_names
      @used_names = IO.read(used_file).split("\n")
    end
  end

  def save_used_name name
    @used_names << name
    if @persist_used_names
      File.open(used_file, 'a') { |f| f.write "#{name}\n"}
    end
  end

  def randomize(array)
    new_array = []
    array.size.downto(1) { |n| new_array.push array.delete_at(rand(n)) }
    new_array
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

  def create_unless_exists(file)
    FileUtils.touch(file) unless File.exists?(file)
  end
end
