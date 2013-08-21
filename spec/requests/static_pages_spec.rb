require 'spec_helper'

describe "Static Pages" do

  let (:base_title) {"Ruby on Rails Tutorial Gabe\'s App"}

  describe "Home Page" do
  	it 'should have the base title' do
  		visit '/static_pages/home'
  		page.should have_selector('title', 
  			:text => "Ruby on Rails Tutorial Gabe\'s App")
  	end
  	it 'should have the content Gabe\'s App' do
  		visit '/static_pages/home'
  		page.should have_selector('h1', :text => 'Gabe\'s App')
  	end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end
  describe "Help Page" do
  	it 'should have the right title' do
      visit '/static_pages/help'
      page.should have_selector('title', 
        :text => "Ruby on Rails Tutorial Gabe\'s App | Help")
  	end
  	it 'should have the content Help' do
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end
  end
  describe "About Page" do
  	it 'should have the right title' do
  		visit '/static_pages/about'
  		page.should have_selector('title', 
  			:text => "| About")
  	end
  	it "should have the content 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1', :text => 'About Us')
  	end
  end
  describe "Contact Page" do
  	it 'should have the right title' do
  		visit '/static_pages/contact'
  		page.should have_selector('title', 
  			:text => "| Contact")
  	end
  	it "should have the content 'Contact Us'" do
  		visit '/static_pages/contact'
  		page.should have_selector('h1', :text => 'Contact Us')
  	end  	
  end
end
