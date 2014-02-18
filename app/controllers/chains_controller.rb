class ChainsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :require_admin, except:[ :new, :create, :show ]

  def new
    @chain = Chain.new
  end

  # TODO: create chain with foreign key for subforum
  def create
    @chain = Chain.new(chain_params)
    @chain.user_id = current_user.id
    if @chain.save
      flash[:success] = 'New thread created!'
      redirect_to chain_path(@chain)
    else
      render 'new'
    end
  end

  def show
    @chain = Chain.find(params[:id])
    @posts = @chain.posts
  end

  # TODO: add delete link for admins in view
  def destroy
    Chain.find(params[:id]).destroy
    # TODO: redirect to the proper subforum after delete
    redirect_to subforums_path
  end

  private

  def chain_params
    params.require(:chain).permit(:title, :body)
  end

end
