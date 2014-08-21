class PostsController < ApplicationController
  before_filter :set_title

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    
  end

  private
  def set_title
    content_for :page_title, "Hello"
  end
end
