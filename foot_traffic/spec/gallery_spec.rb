$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'gallery'
require 'visitor'
require 'sugar'

describe Gallery do
	   
	it "should create a gallery object which have room no " do
		gallery = Gallery.new(4, [99])
		expect(gallery.room_no).to eq 4
	end

	it "should create a gallery object which contains ids of visitors visited that gallery" do
		ids = [10,20,30,40]
		gallery = Gallery.new(4, ids)
		gallery.visitors.each_with_index do |visitor, i|
			 expect(visitor.visitor_id).to eq(ids[i]) 
		end
	end

	describe "#print_visitor_log" do
		it "should print the overall gallery's Â foot-trafficÂ on a minute-to-minute basis" do
			ids = [10]
			gallery = Gallery.new(4, ids)
			gallery.visitors.each do |visitor| 
				visitor.visit = {:I => 300, :O => 320}
			end
			expect(gallery.room_no).to eq 4
			expect(gallery.visitors.first.visitor_id).to eq 10
			expect(gallery.visitors.first.duration.avg(1)).to eq 21

	 		
	 		# TBD expect(gallery.print_visitor_log).to eq("Room 4, 11 minute average visit,1 visitor total")
 		end
 		#TBD extencive coverage
	end

end

