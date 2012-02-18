require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "memory_name_repository"
require "randomizer"

describe Randomizer do
  let(:all_names)       { %w[Jim Joe Jerry John] }
  let(:used_names)      { %w[Jim Joe] }
  let(:name_repository) { MemoryNameRepository.new(all_names, used_names) }

  context "persist flag is true" do
    let(:randomizer) { Randomizer.new(name_repository, true) }

    before do
      randomizer.load_names
    end

    it "loads formerly persisted used names" do
      randomizer.used_names.should == used_names
    end

    it "records used name" do
      name = randomizer.select_name
      randomizer.used_names.should include(name)
    end

    it "persists selected name" do
      name = randomizer.select_name
      name_repository.used.should include(name)
    end

    it "removes used names from available names" do
      randomizer.available_names.sort.should == %w[Jerry John]
    end

    it "selects a name randomly" do
      name = randomizer.select_name
      all_names.should include(name)
    end
  end

  context "persist flag is false" do
    let(:randomizer) { Randomizer.new(name_repository, false) }

    before do
      randomizer.load_names
    end

    it "does not load formerly persisted used names" do
      randomizer.used_names.should be_empty
    end

    it "records used name" do
      name = randomizer.select_name
      randomizer.used_names.should include(name)
    end

    it "does not persist selected name" do
      persisted_used_names = name_repository.used
      name = randomizer.select_name
      name_repository.used.should == persisted_used_names
    end

    it "does not remove used names from available names" do
      randomizer.available_names.sort.should == %w[Jerry Jim Joe John]
    end

    it "selects a name randomly" do
      name = randomizer.select_name
      all_names.should include(name)
    end
  end
end
