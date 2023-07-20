class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Posts::Filter.new(posts: @posts, params: params).call
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :photo)
  end
end

