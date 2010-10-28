require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

##
## UCSCBin::Utils
##

describe UCSCBin::Utils, "#zero_to_one" do 
  it "(0, 10) should return an array [1, 10]" do
    zero_start = 1
    zero_end   = 10
    UCSCBin::Utils.zero_to_one(zero_start, zero_end).should == [0, 10]
  end

  it "(-1, 10) should raise ArgumentError" 

  it "(10, 1) should raise ArgumentError"

  it "(0, 0) should raise ArgumentError"

end

describe UCSCBin::Utils, "#one_to_zero" do 
  it "(1, 10) should return an array [0, 10]" do
    one_start = 1
    one_end   = 10
    UCSCBin::Utils.one_to_zero(one_start, one_end).should == [0, 10]
  end

  it "(-1, 10) should raise ArgumentError" 

  it "(0, 10) should raise ArgumentError"

  it "(10, 1) should raise ArgumentError"
end

##
## UCSCBin::BinRange
##

describe UCSCBin::BinRange, "#bin" do 
  it "(20,000,000-20,000,999) should be 737" do
    bin_start = 20_000_000
    bin_end   = 20_000_999
    UCSCBin::BinRange.bin(bin_start, bin_end).should == 737
  end

  it "(2,000,000,000-9,000,000,100) should raise exception" do
    bin_start = 2_000_000_000
    bin_end   = 9_000_000_100
    caller = lambda{UCSCBin::BinRange.bin(bin_start, bin_end)}
    caller.should raise_error(NotImplementedError)
  end
end

  describe UCSCBin::BinRange, "#bin_all" do 
  it "(20,000,000-20,000,999) should be all bins" do
    bin_start = 20_000_000
    bin_end   = 20_000_999
    UCSCBin::BinRange.bin_all(bin_start, bin_end).should == [737, 92, 11, 1 ,0]
  end

  it "(2,000,000,000-9,000,000,100) should raise exception" do
    bin_start = 2_000_000_000
    bin_end   = 9_000_000_100
    caller = lambda{UCSCBin::BinRange.bin_all(bin_start, bin_end)}
    caller.should raise_error(NotImplementedError)
  end

  it "(20,000,000-20,100,999) should be an array of BINs" do
    bin_start = 20_000_000
    bin_end   = 20_100_999
    UCSCBin::BinRange.bin_all(bin_start, bin_end).should == [737,738,92, 11, 1, 0]
  end

  it "(20,000,000-21,000,999) should be an array of BINs" do
    bin_start = 20_000_000
    bin_end   = 21_000_999
    UCSCBin::BinRange.bin_all(bin_start, bin_end).should ==
      [737, 738, 739, 740, 741, 742, 743, 744, 745, 92, 93, 11, 1, 0]
  end
end

