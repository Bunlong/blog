require 'spec_helper'

describe 'routing to categories' do
  it "routes /categories to categories#index" do
    expect(get: "/categories").to route_to(controller: "categories", action: "index")
  end

  it "routes /categories/1 to categories#show" do
    expect(get: "/categories/1").to route_to(controller: "categories", action: "show", id: "1")
  end
  
  it "routes /categories/new to categories#new" do
    expect(get: "/categories/new").to route_to(controller: "categories", action: "new")
  end

  it "routes /categories to categories#create" do
    expect(post: "/categories").to route_to(controller: "categories", action: "create")
  end

  it "routes /categories/1/edit to categories#edit" do
    expect(get: "/categories/1/edit").to route_to(controller: "categories", action: "edit", id: "1")
  end

  it "routes /categories/1 to categories#update" do
    expect(put: "/categories/1").to route_to(controller: "categories", action: "update", id: "1")
  end

  it "routes /categories/1 to categories#destroy" do
    expect(delete: "/categories/1").to route_to(controller: "categories", action: "destroy", id: "1")
  end
end