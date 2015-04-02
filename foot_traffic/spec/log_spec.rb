$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'log'

describe Log do
	it "Should create a foot print log record of visitor for gallery" do
		log = Log.new(1, 10, "I", 300)
		expect(log.visitor_id).to eq 1
		expect(log.room_no).to eq 10
		expect(log.movement).to eq :I
	end

	it "Should create human readable log object" do
		log = Log.new(1, 10, "I", 300)
		expect(log.to_s).to eq "1 10 I 300"
	end
end