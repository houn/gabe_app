require 'spec_helper'

describe "Static Pages" do
  

  subject {page}

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home Page" do
    before { visit root_path }
  	let(:heading) { 'Gabe\'s App'}
    let(:page_title) { '' }
    it { should_not have_selector('title', :text => 'Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      let(:user2) { FactoryGirl.create(:user) }
      before do
        20.times { FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum") }
      end

      describe "viewing homepage when signed-in" do
        before do
          sign_in user
          visit root_path
        end
        it { should have_selector('h1', text: user.name) }
        it { should have_selector('span', text: "microposts") }

        it "should render the user's feed" do
          user.feed.each do |item|
            page.should have_selector("li##{item.id}", text: item.content)
          end
        end

        describe "follower/following counts" do
          let(:other_user) { FactoryGirl.create(:user) }
          before do
            other_user.follow!(user)
            visit root_path
          end

          it { should have_link("0 following", href: following_user_path(user)) }
          it { should have_link("1 follower", href: followers_user_path(user)) }
        end
      end

      describe "micropost pagination" do
        before do
          15.times { FactoryGirl.create(:micropost, user: user, content: "another test") }
          sign_in user
          visit root_path
        end
        it { should have_selector('div.pagination') }

        it "should list each micropost" do
          user.feed.paginate(page:1).each do |posts|
            page.should have_selector('li', text: posts.content)
          end
        end
      end
    end
  end
  describe "Help Page" do
    before { visit help_path }
  	let(:page_title) { 'Help' }
  	let (:heading) { 'Help' }
  end
  describe "About Page" do
    before { visit about_path }
  	let(:page_title) { 'About' }
  	let(:heading) { 'About Us' }
  end
  describe "Contact Page" do
    before { visit contact_path }
  	let(:page_title) { 'Contact' }
  	let(:heading) { 'Contact Us' }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign Up Now!"
    page.should have_selector 'title', text: full_title('Sign Up')
    click_link "Gabe\'s App"
    page.should have_selector 'h1', text: "Welcome to Gabe\'s App"
  end

end
