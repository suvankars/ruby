#!/usr/bin/env ruby 

require File.join(File.dirname(__FILE__) , 'webpage')
require File.join(File.dirname(__FILE__) , 'query')
require File.join(File.dirname(__FILE__) , 'page_weight')
require File.join(File.dirname(__FILE__) , 'page_shortener')

class SearchEngine
	
	KEYWORDIDF = 'P'
	QUERYIDF = 'Q'

	def initialize(file_name)
		@web_pages, @queries = [], []
		page_number, query_number = 0, 0

		File.readlines(file_name).each do |line|
			

			if (line.match /^#{KEYWORDIDF}/i)
				page_number += 1
				keywords = line.split(" ").drop(1)
				page_id = KEYWORDIDF + page_number.to_s 

				@web_pages << WebPage.new(page_id, keywords)
			end

			if (line.match /^#{QUERYIDF}/i)
				query_number += 1
				keywords = line.split(" ").drop(1)
				query_id = QUERYIDF + query_number.to_s 
				
				@queries << Query.new(query_id, keywords)
			end
		end
	end

	def search
		page_shortener = PageShortener.new
		page_weight = PageWeight.new(web_pages, queries)
	    pages, queries = page_weight.assign
		queries.each do |query|
			strength, page_ids = 0, {}
			query.weighted_keyword.each do |keyword, query_weight|
				pages.each do |page|
					if page.weighted_keyword.has_key?(keyword)
						page_weight = page.weighted_keyword[keyword]
						page_strength = page_weight.to_i * query_weight.to_i 
						strength += page_strength
						page_ids[page.id] = page_strength  if (strength > 0)
					end	
				end
			sorted_page_ids = Hash[page_ids.sort_by{|k, v| v}.reverse].keys
	
			page_shortener.add(SortableWedPage.new(query.id, sorted_page_ids, strength))
			end
		end

		@results = page_shortener.top_five
	end

	def print_pages
		@results.each do |result|
			puts "#{result.qid}: #{result.pids.join(" ")}"
		end
	end
	
	def web_pages
		@web_pages
	end

	def queries
		@queries
	end
end
