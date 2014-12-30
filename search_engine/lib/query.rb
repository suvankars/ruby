class Query
	attr_accessor :id, :keywords, :weighted_keyword

	def initialize(i, k)
		@id = i
		@keywords = k
		@weighted_keyword = {}
	end

	def to_s
		"#{@id}: #{@keywords.join(", ")}"
	end
end
