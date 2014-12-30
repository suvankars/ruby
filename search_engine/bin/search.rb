#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '..','lib' )

#require 'webpage'
#require 'query'
#require 'page_ranker'
require 'search_engine'

require 'optparse'

options = {}

optparse = OptionParser.new do |opts|
	opts.banner  = "Usage: search [options]"
	opts.on("-f", "--file FILENAME", "input data file name") do |f|
		options[:filename] = f  
	end
end

begin
	optparse.parse!
	if options[:filename].nil?
		puts "Missing argument: -f"
		puts optparse
		exit
	end
	rescue OptionParser::InvalidOption, OptionParser::MissingArgument
		#puts $!.to_s
		#puts optparse
	exit
end

begin
	search_engine = SearchEngine.new(options[:filename])
	search_engine.search()
	search_engine.print_pages()
rescue Exception => e
	$stderr.puts "ERROR: #{e.message}"
end
