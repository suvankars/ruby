$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'ugly_number'

describe UglyNumber do
    it "should by default initialized to calculate 1500th ugly number" do
	un = UglyNumber.new({})
	un.number.should == 1500
    end
    it "should initialized to calculate nth ugly number" do
	un = UglyNumber.new({:number => 2000})
	un.number.should == 2000
    end
    
    it "should devides a number (ie. a) by gratest divisible power of a number (ie. b) " do
	un = UglyNumber.new({})
	md = un.max_devisible(12, 2)
	md.should == 3
    end

    it "should check if a number is ugly number or not" do
	un = UglyNumber.new({})
	un.is_ugly_no(12).should == true
    end

    it "should 11 is not an ugly number" do
	un = UglyNumber.new({})
	un.is_ugly_no(11).should == false
    end
    

    it "shpuld get nth ugly number" do
	un = UglyNumber.new({:number => 11})
	un.get_nth_ugly_no.should == 15 
    end

end
