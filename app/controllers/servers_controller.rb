class ServersController < ApplicationController

  before_filter :require_admin, only:[ :new, :create, :update, :destroy ]

  def index
    @search = Server.search(params[:q])
    # TODO: order by maxplayers - players by default
    @servers = @search.result(distinct: true)
  end

  def new
    @server = Server.new
  end

  def create
    @server = Server.new(server_params)
    if @server.save
      flash[:success] = 'Server created!'
      redirect_to servers_path
    else
      render 'new'
    end
  end

  def show
    @server = Server.find(params[:id])
  end

  def destroy
    Server.find(params[:id]).destroy
    redirect_to root_path
  end

  def search
    index
    render :index
  end

  private

  def require_admin
    if not current_user.try(:admin?)
      redirect_to root_path
    end
  end

  def server_params
    params.require(:server).permit(:address, :region, :password, :dedicated)
  end

end
