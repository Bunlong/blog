require 'spec_helper'

describe PostsController, type: :controller do
  describe "#create" do
     let(:http_params) do 
      { 
        post: { 
          title: 'Ruby Programming', 
          body: 'Ruby Programming is good', 
          status: 'open',
          category_id: 1 
        }
      }
    end
  end
end