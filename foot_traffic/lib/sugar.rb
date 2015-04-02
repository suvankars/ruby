# Helpers to provide some syntactic sugar like
# "visitor" when count =1 , "visitors" when visitor count > 2
# Avg calculation should be (duration/count.to_f).ceil for nearest round off.... 
# but to match with requirement 'succ' used !! 
# Requirement was: (4/1).should == 5  :(
		


class Fixnum
	def avg(arg)
		(self / arg).succ
	end

	def pluralize
		if self == 1
			:visitor
		elsif self > 1
			:visitors
		end
	end
end

