$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'query'

describe Query do
	   
	it "should create a wed query object from query id and keywords" do
		query = Query.new("Q1", ["Ford","car", "Review"])
		query.id.should == "Q1"
		query.keywords.should == ["Ford","car", "Review"]
	end

	it "should have a proper string representation" do
		query = Query.new("Q1", ["Ford","car", "Review"])
		query.to_s.should == "Q1: Ford, car, Review"
	end
		 
end

