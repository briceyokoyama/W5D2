class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # byebug
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save!
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_sub_post(params[:post][:sub_id])
    end


  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end

end
