require 'spec_helper'

describe Post do
  it { should ensure_length_of(:title).is_at_least(100) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should ensure_length_of(:body).is_at_least(200) }
  it { should ensure_length_of(:status).is_at_least(20) }
  it { should validate_presence_of(:status) }
end
