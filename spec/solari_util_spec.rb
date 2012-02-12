require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'solari_util'

describe SolariUtil do
  it "returns max" do
    SolariUtil.max.should_not be_nil
  end

  it "pads" do
    SolariUtil.pad("skim").should == "    skim   "
    SolariUtil.pad("micah").should == "   micah   "
    SolariUtil.pad("elizabethian").should == "elizabethia"
  end
end
