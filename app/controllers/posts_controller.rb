class PostsController < ApplicationController
  def index
    @posts = posts
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

  def send_notification
    SendNotification.new(message: "Hey! Check out the newest post!").send
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :photo)
  end

  def posts
    PostPolicy::Scope.new(current_user, Post).resolve
  end
end

