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
    @post = Post.new(post_params)
    if @post.save
      play_flash("Post created successfully")
    else
      play_flash("Post can't create")
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  private
  def set_title
    content_for :page_title, "Post"
  end

  def post_params
    params.require(:post).permit(:title, :body, :status, :category_id)
  end

  def play_flash(message)
    flash[:notice] = message
    redirect_to :back
  end
end
