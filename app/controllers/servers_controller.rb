class ServersController < ApplicationController

  def index
    if params[:search]
      @servers = Server.all.order(:players)
    else
      @servers = Server.all.order(:players)
    end
    # TODO: order by maxplayers - players by default
  end

  def new
    # TODO: before filter instead of if's for admin only pgs
    if current_user.try(:admin?)
      @server = Server.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user.try(:admin?)
      @server = Server.new(server_params)
      if @server.save
        flash[:success] = 'Server created!'
        redirect_to servers_path
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def show
    @server = Server.find(params[:id])
  end

  def destroy
    Server.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def server_params
    params.require(:server).permit(:address, :region, :password, :dedicated)
  end

end
