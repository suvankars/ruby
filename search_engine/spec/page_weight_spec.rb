$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'page_weight'
require 'query'
require 'webpage'

describe PageWeight do
	   
	it "should create an page weight object with web page and queries" do
		query = Query.new("Q1", ["Ford","car", "Review"])
		page = WebPage.new("P1", ["Ford","car", "Review"])

		page_weight = PageWeight.new(page, query)
		
		page_weight.web_pages.id.should == "P1"
		page_weight.queries.id.should == "Q1"
	end

	it "should assign weight to each keyword of web page and query " do
		query = Query.new("Q1", ["Ford", "Review"])
		page = WebPage.new("P1", ["Ford","car", "Review"])
		#TBD
	end
		 
end

