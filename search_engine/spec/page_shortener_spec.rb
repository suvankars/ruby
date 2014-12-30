$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'page_shortener'


describe PageShortener do

	describe "# add" do
			it "should add an sortable web page object with, query and strength" do
			 page1 = SortableWedPage.new("Q1", ["P1","P2","P3"], 123)
			 page2 = SortableWedPage.new("Q2", ["P1","P2","P3"], 144)
			 page_shortener = PageShortener.new
			 page_shortener.add(page1)
			 page_shortener.add(page2)
			 page_shortener.web_entity.count.should == 2
		end
	end

	describe "# sort by strength" do
		it "should sort web pages based on page strength rating" do
			page1 = SortableWedPage.new("Q3", ["P1", "P2", "P3"], 64)
			page2 = SortableWedPage.new("Q1", ["P1", "P3"], 123)
			page3 = SortableWedPage.new("Q2", ["P1", "P2", "P3"], 14)
		    page_shortener = PageShortener.new
			page_shortener.add(page1)
			page_shortener.add(page2)
			page_shortener.add(page3)
			page_shortener.sort
			page_shortener.web_entity.last.strength.should == 123
			page_shortener.web_entity.last.qid.should == "Q1"
			page_shortener.web_entity.last.pids.should == ["P1", "P3"]
		end	
	end

	describe "# top five" do
		it "should return to 5 web pages based on page strength rating" do
			page1 = SortableWedPage.new("Q3", ["P1", "P2", "P3"], 64)
			
			page_shortener = PageShortener.new

			5.times do |i|
				page = "page#{i}" 
				page = SortableWedPage.new("Q3", ["P1", "P2", "P3"], 64+i)
				page_shortener.add(page)
			end

		    page_shortener.sort
			page_shortener.web_entity.last.strength.should == 68
			page_shortener.web_entity.last.qid.should == "Q3"
			page_shortener.web_entity.last.pids.should == ["P1", "P2", "P3"]
		end	
	end
	
		 
end


describe SortableWedPage do
	it "should create a sortable web page entity with page id query id and page rating" do
		sortable_webpage = SortableWedPage.new("Q1", "P1", 122)
		sortable_webpage.pids.should == "P1" 
		sortable_webpage.qid.should == "Q1"
		sortable_webpage.strength.should == 122
	end

end