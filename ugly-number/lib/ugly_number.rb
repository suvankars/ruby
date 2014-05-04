#!/usr/bin/env ruby

class UglyNumber
    attr_reader :number
    NUMBER = 150
    def initialize(options)
	input_number = options[:number]
	@number = input_number.nil? ? NUMBER : input_number
    end
   
    def max_devisible(a, b)
	while(a%b == 0)
	    a = a/b
	end
	a
    end

    def is_ugly_no(no)
	no = max_devisible(no, 2)
	no = max_devisible(no, 3)
	no = max_devisible(no, 5)
	no == 1? true : false
    end	

    def get_nth_ugly_no
	n = number 
	i, count = 1, 1 
	while(n > count)
	    i +=1
            count +=1  if (is_ugly_no(i))
	end
	puts "#{number}th ugly number is #{i}"
	i
    end
       	
end
