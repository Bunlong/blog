require 'spec_helper'

describe Post, 'validation' do
  it { should ensure_length_of(:title).is_at_least(10) }
  it { should ensure_length_of(:title).is_at_most(100) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  it { should ensure_length_of(:body).is_at_least(20) }
  it { should ensure_length_of(:body).is_at_most(200) }

  it { should ensure_length_of(:status).is_at_least(2) }
  it { should ensure_length_of(:status).is_at_most(20) }
  it { should validate_presence_of(:status) }

  it { should validate_presence_of(:category_id) }
end

describe Post, 'association' do
  it { should have_many(:categorizations) }
  it { should have_many(:categories).through(:categorizations) }
end

describe Post, 'column_specification' do
  it { should have_db_column(:title).of_type(:string).with_options(length: { minimum: 10, maximum: 100 }, presence: true, uniqueness: true) }
  it { should have_db_column(:body).of_type(:text).with_options(length: { minimum: 20, maximum: 200 }) }
  it { should have_db_column(:status).of_type(:string).with_options(length: { minimum: 2, maximum: 20, presence: true }) }
  it { should have_db_column(:category_id).of_type(:integer) }

  it { should have_db_index(:title).unique(true) }
end

describe Post, '.search_by_name' do
  before(:each) do
    FactoryGirl.create(:post, title: 'Ruby on Rails')
  end

  it 'returns post that match with title' do
    Post.search_by_title('Ruby on Rails').count.should eql 1
  end

  it 'returns post that like title' do
    Post.search_by_title('ruby on rails').count.should eql 1
  end

  it 'returns post when title is blank' do
    Post.search_by_title('').count.should eql 1
  end

  it 'returns empty when title is not match' do
    Post.search_by_title('not match').count.should eql 0
  end
end