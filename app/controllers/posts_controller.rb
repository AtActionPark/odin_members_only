class PostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def signed_in_user
    unless signed_in? 
    flash[:danger] = "Please sign in to post"
    redirect_to signin_path 
    end
  end

  def post_params
    params.require(:posts).permit(:content)
  end
end
