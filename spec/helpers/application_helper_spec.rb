require 'spec_helper'

describe ApplicationHelper do
	
	describe "full_title" do
		it "should include the page title" do
			full_title("foo").should =~ /foo/
		end
		it "should include the base title" do
			full_title("foo").should =~ /^Ruby on Rails Tutorial Gabe's App/
		end
		it "should not include a bar for the home page" do
			full_title("").should_not =~ /\|/
		end
	end

	describe "pluralize" do
		if(Micropost.count > 0)
			it { pluralize(2, "micropost").should == "2 microposts"}
		else
			it { pluralize(1, "micropost").should == "1 micropost"}
		end
	end
end