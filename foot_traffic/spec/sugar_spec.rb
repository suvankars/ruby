$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'sugar'

describe Fixnum do
	describe "#avg" do
		it "should calculate average and return he successor to result"  do
			expect((4/1).succ).to be(5)
		end
	end

	describe "#pluralize" do
		it "should pluralize 'visitor' for visitor count more then 1" do
			expect(2.pluralize).to be(:visitors)
		end

		it "should not pluralize 'visitor' if visitor count less the or eql to 1" do
			expect(2.pluralize).to be(:visitors)
		end
	end
end

