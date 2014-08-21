require 'spec_helper'

describe 'routing to api/v1/posts' do
  it "routes api/v1/posts to posts#index" do
    expect(get: "api/v1/posts").to route_to(controller: "api/v1/posts", action: "index", format: "json")
  end

  it "routes api/v1/posts/1 to posts#show" do
    expect(get: "api/v1/posts/1").to route_to(controller: "api/v1/posts", action: "show", id: "1", format: "json")
  end
  
  it "routes api/v1/posts/new to posts#new" do
    expect(get: "api/v1/posts/new").to route_to(controller: "api/v1/posts", action: "new", format: "json")
  end

  it "routes api/v1/posts to posts#create" do
    expect(post: "api/v1/posts").to route_to(controller: "api/v1/posts", action: "create", format: "json")
  end

  it "routes api/v1/posts/1/edit to posts#edit" do
    expect(get: "api/v1/posts/1/edit").to route_to(controller: "api/v1/posts", action: "edit", id: "1", format: "json")
  end

  it "routes api/v1/posts/1 to posts#update" do
    expect(put: "api/v1/posts/1").to route_to(controller: "api/v1/posts", action: "update", id: "1", format: "json")
  end

  it "routes api/v1/posts/1 to posts#destroy" do
    expect(delete: "api/v1/posts/1").to route_to(controller: "api/v1/posts", action: "destroy", id: "1", format: "json")
  end
end