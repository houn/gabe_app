include ApplicationHelper

def valid_signin(user)
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
	# sign in when not using capybara as well.
	cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :have_success_message do |title, message|
	match do |page|
		page.should have_selector('title', text: title)
		page.should have_selector('div.alert.alert-success', text: message)
	end
end