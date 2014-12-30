class PageShortener
	attr_reader :web_entity
	def initialize
		@web_entity = []
	end

	def add(page)
		@web_entity.push page
	end
	
	def sort
 		@web_entity.sort!{|a,b| a.strength <=> b.strength }		
	end


	def top_five
		sort.last 5
	end

end


				 
class SortableWedPage
    attr_accessor :qid, :pids, :strength

    def initialize(qid, pids, strength)
        @qid = qid
        @pids = pids
        @strength = strength
    end
    def print_pages
		formated_result = "#{self.qid}: #{self.pids.join(" ")}"
		puts formated_result
		return formated_result
	end

end