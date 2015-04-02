$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'visitor'


describe Visitor do
	   
	it "should create a visitor object for gallery" do
		visitor = Visitor.new(10)
		expect(visitor.visitor_id).to eq(10)
	end
	
	describe "#add" do
		
		it "should add visitor movement(in/out) and timestamp(in itme/ out time) to visit" do
			visitor = Visitor.new(10)
			visitor.add(:I, 300)
			visitor.add(:O, 310)
			expect(visitor.visit).to eq({:I => 300, :O => 310})
		end

	end

	describe "#duration" do

		it "should calculate amount of time visitor spent in a room of gallery" do
			visitor = Visitor.new(10)
			visitor.add(:I, 300)
			visitor.add(:O, 310)
			expect(visitor.duration).to eq(10)
		end	

		it "should calculate duration only if out time is greter then in time" do
			visitor = Visitor.new(10)
			visitor.add(:I, 310)
			visitor.add(:O, 300)
			expect(visitor.duration).to eq(0) 
		end

	end
 
end

