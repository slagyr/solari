require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "randomizer"

describe Randomizer do

  before(:all) do
    @test_dir = File.dirname(__FILE__) + "/../test_dir"
    Dir.mkdir(@test_dir) if !File.exists?(@test_dir)
    Randomizer.data_home = @test_dir
  end

  before do
    @randomizer = Randomizer.new
  end

  it "should load the all" do
    File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry}.join("\n")}

    @randomizer.load_names

    @randomizer.names.should == %w{Jim Joe Jerry}
  end

  it "should load solari.used" do
    File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim}.join("\n")}

    @randomizer.load_names

    @randomizer.used_names.should == %w{Jim}
  end

  it "should save selected names" do
    File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write ""}

    @randomizer.save_used_name "Joe"
    @randomizer.used_names.should == ["Joe"]
    IO.read(File.join(@test_dir, "solari.used")).should == "Joe\n"

    @randomizer.save_used_name "Joel"
    @randomizer.used_names.should == ["Joe", "Joel"]
    IO.read(File.join(@test_dir, "solari.used")).should == "Joe\nJoel\n"
  end

  it "should have available names" do
    File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry John}.join("\n")}
    File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim Joe}.join("\n")}

    @randomizer.load_names

    @randomizer.available_names.should == %w{Jerry John}
  end

  it "selects a name randomly" do
    File.open(File.join(@test_dir, "solari.all"), 'w') { |f| f.write %w{Jim Joe Jerry John}.join("\n")}
    File.open(File.join(@test_dir, "solari.used"), 'w') { |f| f.write %w{Jim Joe}.join("\n")}

    @randomizer.load_names
    name = @randomizer.select_name

    %w{Jerry John}.include?(name).should == true
    @randomizer.used_names.include?(name).should == true
    @randomizer.available_names.include?(name).should == false
  end
end