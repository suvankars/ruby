class Visitor
	IN, OUT = :I, :O
	attr :visitor_id
	attr_accessor:visit

	def initialize(id)
		@visitor_id = id
		@visit = {}
	end

	def add(movement, timestamp)
		@visit[movement] = timestamp
	end

	def duration
		duration = 0
		if (visit.any? && visit[OUT] > visit[IN])
			duration = visit[OUT] - visit[IN] 
		end
		duration
	end
end
