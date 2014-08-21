require 'spec_helper'

feature "index page" do

  before(:each) do
    @posts = []
    @posts << FactoryGirl.create(:post)
    @posts << FactoryGirl.create(:post, title: 'Ruby Programming', body: 'Ruby programming is good', status: 'open', category_id: 1)
    @posts << FactoryGirl.create(:post, title: 'Erlang Programming', body: 'Erlang programming is good', status: 'open', category_id: 1)
    
    visit posts_path
  end

  scenario "should return status 200" do
    page.status_code.should be 200
  end

  scenario "should have 'Post List' in h3" do
    within('h3') do
      page.should have_content "Post List"
    end
  end

  scenario "should list the posts title" do
    @posts.each do |post|
      page.should have_content post.title
    end
  end

  scenario "should have Add New link" do
    page.should have_link 'Add New'
  end

  scenario "should link to new page when click on Add New link" do
    page.click_link "Add New"
    current_url.should eq current_host + new_post_path
  end
end

feature "new page" do
  before(:each) do
    @categories = []
    @categories << FactoryGirl.create(:category)

    visit new_post_path(@categories)
  end
  
  scenario "should return status 200" do
    page.status_code.should be 200
  end

  scenario "should have 'Add New Post' in h3" do
    within('h3') do
      page.should have_content "Add New Post"
    end
  end

  scenario "should have the title field" do
    fill_in 'Title', with: 'Ruby Programming'
    page.should have_field 'Title', with: 'Ruby Programming'
  end

  scenario "should have the status selectbox" do
    page.should have_select 'Status', options: ['open', 'closed']
  end

  scenario "should have the status selectbox that selected 'open' when select 'open' item" do
    page.select 'open', from: 'Status'
    page.should have_select 'Status', selected: 'open'
  end

  scenario "should have the category selectbox" do
    page.should have_select 'Category'
  end

  scenario "should have the category selectbox that selected 'Programming' when select 'Programming' item" do
    page.select 'Programming', from: 'Category'
    page.should have_select 'Category', selected: 'Programming'
  end

  scenario "should have message successfully save", focus: true do
    click_button "Save"
  end
end
