require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

##
## UCSCBin::Utils
##

describe UCSCBin::Utils, "#zero_to_one" do 
  it "(0, 10) should return an array [1, 10]" do
    UCSCBin::Utils.zero_to_one(0 , 10).should == [1, 10]
  end

  it "(-1, 10) should raise ArgumentError" do
    caller = lambda{UCSCBin::Utils.zero_to_one(-1, 10)}
    caller.should raise_error(ArgumentError)
  end    
  
  it "(10, 1) should raise ArgumentError" do
    caller = lambda{UCSCBin::Utils.zero_to_one(10, 1)}
    caller.should raise_error(ArgumentError)
  end

  it "(0, 0) should raise ArgumentError" do 
    caller = lambda{UCSCBin::Utils.zero_to_one(10, 1)}
    caller.should raise_error(ArgumentError)
  end
end

describe UCSCBin::Utils, "#one_to_zero" do 
  it "(1, 10) should return an array [0, 10]" do
    UCSCBin::Utils.one_to_zero(1, 10).should == [0, 10]
  end

  it "(-1, 10) should raise ArgumentError" do 
    caller = lambda{UCSCBin::Utils.one_to_zero(-1, 10)}
    caller.should raise_error(ArgumentError)
  end

  it "(0, 10) should raise ArgumentError" do 
    caller = lambda{UCSCBin::Utils.one_to_zero(0, 10)}
    caller.should raise_error(ArgumentError)
  end

  it "(10, 1) should raise ArgumentError" do 
    caller = lambda{UCSCBin::Utils.one_to_zero(0, 10)}
    caller.should raise_error(ArgumentError)
  end
end
