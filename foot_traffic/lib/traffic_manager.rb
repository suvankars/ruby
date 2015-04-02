#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__) , 'log')
require File.join(File.dirname(__FILE__) , 'gallery')
require File.join(File.dirname(__FILE__) , 'sugar')

class TrafficManager

	def initialize(file_name)
		@logs = [] 
		File.readlines(file_name).collect do |line|
			if !line.match(/\d{1,3}\s\d{1,4}\sI|O\s\d{1,4}/).nil? #TBD strict regx
			
				visit_log = line.split
				visitor_id = visit_log.shift
				room_no = visit_log.shift
				movement = visit_log.shift
				duration = visit_log.shift
				
				@logs << Log.new(visitor_id, room_no, movement, duration)	
			end
		end
	end
	    
	
	def analyze 
	  @logs.sort!{|a,b| a.room_no <=> b.room_no }
	  
	  room_nos = @logs.collect{|l| l.room_no }
	  visitor_ids = @logs.collect{|l| l.visitor_id }.uniq
	  @gallery_rooms = room_nos.uniq.collect{ |room| Gallery.new(room, visitor_ids)}
	  
	  visitors = @gallery_rooms.collect{|t| t.visitors }


	  @gallery_rooms.each do |room|
	  	room.visitors.each do |visitor|
	  		logs = @logs.select{ |l| l.room_no == room.room_no && l.visitor_id == visitor.visitor_id }
	  		logs.each do |log|
	  			visitor.add(log.movement, log.duration)
	  		end
		end
	  end
	end
	
	def print_traffic
	    @gallery_rooms.each{ |r| r.print_visitor_log}
	end

	def visitor_log
		@logs
	end

	def gallery_rooms
		@gallery_rooms
	end

   
	

	
end
