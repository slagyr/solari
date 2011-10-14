require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "default_scene", :hidden => true

  before do
    @randomizer = mock("randomizer", :load_names => nil)
    production.randomizer = @randomizer
  end

  it "has a display and a button" do
    scene.display.id.should == "display"
    scene.select_name_button.id.should == "select_name_button"
  end

  it "displays randomized name when clicking button" do
    @randomizer.should_receive(:select_name).and_return("Fred Lee")

    scene.select_name_button.mouse_clicked nil

    scene.display.selected_name.should == "Fred Lee"
  end

end