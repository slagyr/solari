require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "randomizer"

describe Randomizer do

  before(:all) do
    @test_dir = File.dirname(__FILE__) + "/../test_dir"
    Dir.mkdir(@test_dir) unless File.exists?(@test_dir)
  end

  before do
    @randomizer = Randomizer.new(@test_dir, false)
  end

  it "loads solari.all" do
    File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry}.join("\n")}

    @randomizer.load_names
    @randomizer.names.should == %w{Jim Joe Jerry}
  end

  context "persist flag is true" do
    let(:randomizer) { Randomizer.new(@test_dir, true) }

    it "loads solari.used" do
      File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim}.join("\n")}

      randomizer.load_names
      randomizer.used_names.should == %w{Jim}
    end

    it "saves selected names" do
      File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write ""}

      randomizer.save_used_name "Joe"
      randomizer.used_names.should == ["Joe"]
      IO.read(File.join(@test_dir, "solari.used")).should == "Joe\n"

      randomizer.save_used_name "Joel"
      randomizer.used_names.should == ["Joe", "Joel"]
      IO.read(File.join(@test_dir, "solari.used")).should == "Joe\nJoel\n"
    end

    it "removes used names from available names" do
      File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry John}.join("\n")}
      File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim Joe}.join("\n")}

      randomizer.load_names
      randomizer.available_names.sort.should == %w{Jerry John}
    end

    it "selects a name randomly" do
      File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry John}.join("\n")}
      File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim Joe}.join("\n")}

      randomizer.load_names
      name = randomizer.select_name

      %w{Jerry John}.include?(name).should == true
      randomizer.used_names.include?(name).should == true
      randomizer.available_names.include?(name).should == false
    end
  end

  context "persist flag is false" do
    it "does not load solari.used" do
      File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim}.join("\n")}

      @randomizer.load_names
      @randomizer.used_names.should == []
    end

    it "returns all names from solari.all" do
      File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry John}.join("\n")}
      File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim Joe}.join("\n")}

      @randomizer.load_names
      @randomizer.available_names.sort.should == %w{Jerry Jim Joe John}
    end

    it "selects a name randomly" do
      File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry John}.join("\n")}
      File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim Joe}.join("\n")}

      @randomizer.load_names
      name = @randomizer.select_name

      %w{Jim Joe Jerry John}.include?(name).should == true
      @randomizer.used_names.include?(name).should == true
      @randomizer.available_names.include?(name).should == false
    end
  end
end
