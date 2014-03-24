require 'spec_helper'

describe Categorization, 'validation' do
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:post_id) }
end

describe Categorization, 'association' do
  it { should belong_to(:category) }
  it { should belong_to(:post) }
end

describe Categorization, 'column_specification' do
  it { should have_db_column(:category_id).of_type(:integer).with_options(presence: true) }
  it { should have_db_column(:post_id).of_type(:integer).with_options(presence: true) }
end