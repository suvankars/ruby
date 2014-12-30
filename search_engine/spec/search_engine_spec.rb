$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'search_engine'

describe SearchEngine do
	before do
	    @entity = SearchEngine.new('data.in')
	end
	describe "# initialization" do
		it "should create webpage and query from test input file" do
			
			@entity.web_pages.count.should == 6 
			@entity.queries.count.should == 6
			@entity.queries.first.id.should == "Q1"
			@entity.web_pages.first.id.should == "P1"
		end
	end

	describe "# initialization" do
		it "should search top five web pages" do
			result  = @entity.search
			result.count.should == 5
			result.first.qid.should == "Q1"
			result.last.qid.should == "Q5"
			result.first.pids.should == ["P1", "P3"]
			result.last.pids.should == ["P6", "P3", "P4", "P2", "P5", "P1"]
		end
	end

	describe "# print pages" do
		it "should print top five pages in expected format" do
			expected_result = [ "Q1: P1 P3", 
							    "Q3: P3 P2 P1",
							    "Q4: P2 P3 P1",
							    "Q2: P6 P4 P5 P2 P1",
							    "Q5: P6 P3 P4 P2 P5 P1" ]

			results = @entity.search
			results.each_with_index do |result, i|
				result.print_pages.should == expected_result[i]
			end
		end
		
	end

end