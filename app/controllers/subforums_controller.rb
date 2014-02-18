class SubforumsController < ApplicationController

  before_filter :require_admin, except:[ :index, :show ]
  before_filter :authenticate_user!

  def index
    @subforums = Subforum.all
  end

  def new
    @subforum = Subforum.new
  end

  def create
    @subforum = Subforum.new(subforum_params)
    if @subforum.save
      flash[:success] = 'Subforum created!'
      redirect_to subforum_path(@subforum)
    else
      render 'new'
    end
  end

  def show
    @subforum = Subforum.find(params[:id])
    @chains = @subforum.chains
  end

  # TODO: add delete link for admins in view
  def destroy
    Subforum.find(params[:id]).destroy
    redirect_to subforums_path
  end

  private

  def subforum_params
    params.require(:subforum).permit(:name)
  end

end
