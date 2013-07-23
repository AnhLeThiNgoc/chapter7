require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title))}
  end

  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get static_pages_index_path
      response.status.should be(200)
    end
  end
  describe "Home page" do
  	
  	# it "should have the content 'Sample App'" do
  	# 	visit root_path
  	# 	expect(page).to have_content('Sample App')
  	# end
  	# it "should have the base title" do
  	# 	visit root_path
  	# 	expect(page).to have_title("Ruby on Rails Tutorial Sample App")
  	# end
  	# it "should not have a custom page title" do
  	# 	visit root_path
  	# 	expect(page).not_to have_title(' | Home')
  	# end

  	# cach khac tuong tuong
  	before {visit root_path}
  	it "should have the content 'Sample App'" do
    	expect(page).to have_content('Sample App')
  	end

  	it "should have the base title" do
    	expect(page).to have_title("Ruby on Rails Tutorial Sample App")
  	end

 	 it "should not have a custom page title" do
    	expect(page).not_to have_title('| Home')
  	end
  	it { should have_content('Sample App')}
  	it { should have_title( "Ruby on Rails Tutorial Sample App")}
  	it { should_not have_title(' | Home')}
  	it { should have_title(full_title(''))}
  	it { should_not have_title(' | Home')}
  end

  describe "Contact page" do
  	it "should have the content 'Contact'" do
  		visit contact_path
  		expect(page).to have_content('Contact')
  	end

  	it "should have the litle 'Contact'" do
  		visit contact_path
  		expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
  	end
  end

  it " should have the right links on the layout " do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About us'))
    click_link "Help"
    expect(page).to #fill in
    click_link "Contact"
    expect(page).to #fill in
    click_link "Home"
    click_link "Sign up now !"
    expect(page).to #fill in
    click_link "sampe app"
    expect(page).to #fill in
  end
end
