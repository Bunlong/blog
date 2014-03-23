require 'spec_helper'

describe Categorization, 'validation' do
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:post_id) }
end

describe Categorization, 'association' do
  it { should belong_to(:category) }
  it { should belong_to(:post) }
end