$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'traffic_manager'

describe TrafficManager do
	it "should create foot traffic log from test input file" do
		 foot_traffic = TrafficManager.new('data.in')
		 expect(foot_traffic.visitor_log.count).to eq  36 
	end

	describe "#analyze" do
		it "should alalyze all logs of the gallery" do
			foot_traffic = TrafficManager.new('data.in')
			foot_traffic.analyze
			rooms = foot_traffic.gallery_rooms

			expect(rooms[0].room_no).to eq 1
			expect(rooms[0].visitors.first.visitor_id).to eq 8
			expect(rooms[0].visitors.first.duration).to eq 84
			expect(rooms[0].visitors.first.duration.avg(1)).to eq 85

			expect(rooms[1].room_no).to eq 2
			expect(rooms[1].visitors.first.visitor_id).to eq 8
			expect(rooms[1].visitors[2].duration).to eq 80
			expect(rooms[1].visitors[2].duration.avg(1)).to eq 81
		
		end
	end
end

