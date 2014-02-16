class ServersController < ApplicationController

  def index
    if params[:search]
      @servers = Server.all.order(:players)
    else
      @servers = Server.all.order(:players)
    end
    #TODO: Order by maxplayers - players by default
  end

  def new
    # TODO: Before filter
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
      render root_path
    end
  end

  def show
    @server = Server.find(params[:id])
  end

  def destroy
    Server.find(params[:id]).destroy
    redirect_to root_path
    # TODO: do something
  end

  private

  def server_params
    params.require(:server).permit(:address, :region, :password, :dedicated)
  end

end
