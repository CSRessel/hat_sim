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
    @server = Server.new(remove_passwd_conf)
    if server_params[:password] == server_params[:password_confirmation]
      if @server.save
        flash[:success] = 'Server created!'
        redirect_to servers_path
      else
        render 'new'
      end
    else
      @server.errors[:password_confirmation] = 'must match password'
      render 'new'
    end
  end

  def show
    @server = Server.find(params[:id])
  end

  def destroy
    Server.find(params[:id]).destroy
    redirect_to servers_path
  end

  def search
    index
    render :index
  end

  private

  def server_params
    params.require(:server).permit(:address, :name, :password, :password_confirmation, :tags, :region, :dedicated, :game)
    #params.require(:server).permit(:address, :name, :password, :tags, :region, :dedicated, :game)
  end

  def remove_passwd_conf
    tmp_params = server_params
    tmp_params.delete :password_confirmation
    return tmp_params
  end

end
