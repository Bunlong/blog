require 'spec_helper'

feature "index page" do
  before(:each) do
    # @posts = []
    # @posts << FactoryGirl.create(:post)
    # @posts << FactoryGirl.create(:post, title: 'Ruby Programming', body: 'Ruby programming is good', status: 'open', category_id: 1)
    # @posts << FactoryGirl.create(:post, title: 'Erlang Programming', body: 'Erlang programming is good', status: 'open', category_id: 1)

    visit posts_path
  end

  scenario "should return status 200" do
    page.status_code.should be 200
  end

  scenario "should have 'Post List' in h3" do
    @posts = []
    @posts << FactoryGirl.create(:post)
    @posts << FactoryGirl.create(:post, title: 'Ruby Programming', body: 'Ruby programming is good', status: 'open', category_id: 1)
    @posts << FactoryGirl.create(:post, title: 'Erlang Programming', body: 'Erlang programming is good', status: 'open', category_id: 1)

    within('h3') do
      page.should have_content "Post List"
    end
  end

  scenario "should list the posts title" do
    @posts = []
    @posts << FactoryGirl.create(:post)
    @posts << FactoryGirl.create(:post, title: 'Ruby Programming', body: 'Ruby programming is good', status: 'open', category_id: 1)
    @posts << FactoryGirl.create(:post, title: 'Erlang Programming', body: 'Erlang programming is good', status: 'open', category_id: 1)
    visit posts_path

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

  scenario "should link to edit page when click on Edit link" do
    @posts = []
    @posts << FactoryGirl.create(:post, title: 'Erlang TOP Programming', body: 'Erlang TOP programming is good', status: 'open', category_id: 1)
    visit posts_path
  
    page.click_link "Edit"
    current_url.should eq current_host + edit_post_path(@posts[0])
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

  scenario "should have message 'Post can't create' when click button Save without filling in the form" do
    click_button "Save"
    page.should have_content "Post can't create"
  end

  scenario "should have message 'Post created successfully' when click button Save with filling in the form" do
    fill_in 'Title', with: "Ruby on Rails"
    fill_in 'Body', with: "Ruby on Rails is good"
    page.select 'open', from: 'Status'
    page.select 'Programming', from: 'Category'

    click_button "Save"
    page.should have_content "Post created successfully"
  end

end

feature "edit page" do
  before(:each) do
    @post = FactoryGirl.create(:post)
    @categories = [FactoryGirl.create(:category)]

    visit edit_post_path(@post, @categories)
  end

  scenario "should return status 200" do
    page.status_code.should be 200
  end

  scenario "should have 'Edit Post' in h3" do
    within('h3') do
      page.should have_content "Edit Post"
    end
  end

  scenario "should have the title with 'Ruby on Rails'" do
    page.should have_field 'Title', with: 'Ruby on Rails'
  end

  scenario "should have the status selectbox" do
    page.should have_select 'Status', options: ['open', 'closed']
  end

  scenario "should have the status selectbox that selected 'open' when select 'open' item" do
    page.should have_select 'Status', selected: 'open'
  end

  scenario "should have the category selectbox that selected 'Programming' when select 'Programming' item", focus: true do
    page.should have_select 'Category', selected: 'Programming'
  end
end