require 'spec_helper'

describe Category, 'validation' do
  it { should ensure_length_of(:name).is_at_least(10) }
  it { should ensure_length_of(:name).is_at_most(50) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should ensure_length_of(:short_name).is_at_least(10) }
  it { should ensure_length_of(:short_name).is_at_most(50) }
  it { should validate_presence_of(:short_name) }
  it { should validate_uniqueness_of(:short_name) }
end

describe Category, 'association' do
  it { should have_many(:categorizations) }
  it { should have_many(:posts).through(:categorizations) }
end

describe Category, 'column_specification' do
  it { should have_db_column(:name).of_type(:string).with_options(length: { minimum: 10, maximum: 50 }, presence: true, uniqueness: true) }
  it { should have_db_column(:short_name).of_type(:string).with_options(length: { minimum: 10, maximum: 50 }, presence: true, uniqueness: true) }
  it { should have_db_column(:description).of_type(:text).with_options(length: { maximum: 200 }) }
end

describe Category, 'action' do
  before :each do
    @category = Factory(:category)
  end
end