class ServersController < ApplicationController

  before_filter :require_admin, except:[ :index, :show, :search ]
  before_filter :authenticate_user!, :except => [ :index, :search ]

  def index
    @search = Server.search(params[:q])
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
