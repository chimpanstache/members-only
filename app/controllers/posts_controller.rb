class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      redirect_to :new
    else
      redirect_to new_posts_path
    end
  end

  def index
    @posts = Post.all
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
