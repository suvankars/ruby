$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'webpage'

describe WebPage do
	   
	it "should create a webpage object from page id and keywords" do
		page = WebPage.new("P1", ["Ford","car", "Review"])
		page.id.should == "P1"
		page.keywords.should == ["Ford","car", "Review"]
	end

	it "should have a proper string representation" do
		page = WebPage.new("P1", ["Ford","car", "Review"])
		page.to_s.should == "P1: Ford, car, Review"
	end
		 
end

