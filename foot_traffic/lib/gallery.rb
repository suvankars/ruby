#require File.join(File.dirname(__FILE__) , 'visitor')
require File.join(File.dirname(__FILE__) , 'visitor')

class Gallery
	attr :room_no, :visitors
	def initialize(room_no, ids)
		@room_no = room_no
		@visitors = ids.collect{ |id| Visitor.new(id) }
	end

	def print_visit(duration, count)
		
		time_spent = duration.avg(count) if ( duration.nonzero? && count.nonzero? )
		print "#{time_spent} minute average visit," 
	end 

	def print_visitor_log
		visitor_count = visitors.select{|v| v.visit.any? }.count
		visit_duration = visitors.collect{|t| t.duration }.inject(:+)||0

		print "Room #{room_no}, "
		print_visit(visit_duration, visitor_count)
		print "#{visitor_count} #{visitor_count.pluralize} total"
		puts 
	end

end