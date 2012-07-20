require 'fileutils'

class FilesystemNameRepository
  attr_reader :names_list

  def initialize(data_home, names_list)
    @data_home = data_home
    @names_list = names_list || 'solari.all'
  end

  def all
    IO.read(names_file).split("\n")
  end

  def used
    IO.read(used_file).split("\n")
  end

  def add_used(name)
    File.open(used_file, 'a') { |f| f.write "#{name}\n"}
  end

  private

  def names_file
    file = File.join(@data_home, @names_list)
    create_unless_exists(file)
    file
  end

  def used_file
    file = File.join(@data_home, "solari.used")
    create_unless_exists(file)
    file
  end

  def create_unless_exists(file)
    FileUtils.touch(file) unless File.exists?(file)
  end
end
