FactoryGirl.define do
	factory :user do
		name		"Gabe Good"
		email		"gabe@gabe.com"
		password 	"foobar"
		password_confirmation "foobar"
	end
end