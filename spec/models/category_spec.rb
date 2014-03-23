require 'spec_helper'

describe Category, 'validation' do
  it { should ensure_length_of(:name).is_at_least(50) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should ensure_length_of(:short_name).is_at_least(50) }
  it { should validate_presence_of(:short_name) }
  it { should validate_uniqueness_of(:short_name) }
end

describe Category, 'association' do
  it { should have_many(:categorizations) }
  it { should have_many(:posts).through(:categorizations) }
end