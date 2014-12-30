	class PageWeight
	MAX_WEIGHT = 8

	attr_reader :web_pages, :queries

	def initialize(web_pages, queries)
		@web_pages = web_pages
		@queries = queries
	end

	def assign
		weighted_page = web_pages.collect do |web_page|  
			weighted_page  = {}
			web_page.keywords.each_with_index do |p, i|
				weighted_page[p] = MAX_WEIGHT - i 
			end
			web_page.weighted_keyword = weighted_page
			web_page
		end

		weighted_query = queries.collect do |query|
			weighted_query = {}
			query.keywords.each_with_index do |q, i|
				weighted_query[q] = MAX_WEIGHT - i
			end
			query.weighted_keyword = weighted_query
			query
		end
				
		return weighted_page, weighted_query
	end

end


