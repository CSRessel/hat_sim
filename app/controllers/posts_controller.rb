class PostsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :require_admin, except:[ :new, :create, :show ]

  def new
    @post = Post.new
  end

  # TODO: create post with foreign key for chain
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  # TODO: redirect to the thread on #show
  #def show
    #redirect_to chain_url(@post.chain)
  #end

  # TODO: add delete link for admins in view
  def destroy
    Post.find(params[:id])
    # TODO: redirect to the thread after delete
    redirect_to subforums_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
