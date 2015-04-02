class Log
	attr_accessor :visitor_id, :room_no, :movement, :duration

	def initialize(v_id, r_no, movement, duration)
		@visitor_id = v_id.to_i
		@room_no = r_no.to_i
		@movement = movement.to_sym
		@duration = duration .to_i
	end

	def to_s
		"#{@visitor_id} #{room_no} #{movement} #{duration}"
	end
end

