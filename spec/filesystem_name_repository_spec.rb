require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "filesystem_name_repository"

describe FilesystemNameRepository do
  let(:test_dir)   { File.dirname(__FILE__) + "/../test_dir" }
  let(:repository) { FilesystemNameRepository.new(test_dir) }

  def seed_names_to_file(names, filename)
    File.open(File.join(test_dir, filename), 'w')  { |f| names.each { |name| f.puts name } }
  end

  before(:all) do
    Dir.mkdir(test_dir) unless File.exists?(test_dir)
  end

  context 'with empty files' do
    let(:all_names)  { [] }
    let(:used_names) { [] }

    before do
      seed_names_to_file(all_names, 'solari.all')
      seed_names_to_file(used_names, 'solari.used')
    end

    it '#all returns an empty list' do
      repository.all.should be_empty
    end

    it '#used returns an emtpy list' do
      repository.used.should be_empty
    end

    it '#add_used writes the given name to the used file' do
      repository.add_used 'Terry'
      File.read(File.join(test_dir, "solari.used")).should == "Terry\n"
    end
  end

  context 'with populated files' do
    let(:all_names)  { %w[Jim Joe Jerry John] }
    let(:used_names) { %w[Jim Joe] }

    before do
      seed_names_to_file(all_names, 'solari.all')
      seed_names_to_file(used_names, 'solari.used')
    end

    it '#all returns a list of names from the all file' do
      repository.all.should == all_names
    end

    it '#used returns a list of names from the used file' do
      repository.used.should == used_names
    end

    it '#add_used writes the given name to the used file' do
      repository.add_used 'Terry'
      File.read(File.join(test_dir, "solari.used")).should == "Jim\nJoe\nTerry\n"
    end
  end
end
