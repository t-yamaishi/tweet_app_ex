class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
   set_post
  end

  def edit
    set_post
  end

  def update
    set_post
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to new_post_path
    else
      render :new
    end
  end

  def destroy
    set_post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
