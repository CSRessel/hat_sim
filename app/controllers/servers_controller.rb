class ServersController < ApplicationController

  before_filter :require_admin, except:[ :index, :show, :search ]
  before_filter :authenticate_user!, :except => [ :index, :search ]

  def index
    update_all_servers
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
    update_server(params[:id])
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

  # Updatey stuff

  def update_server(id)
    @server = Server.find(id)
    ip_address = IPAddr.new(@server.address[/[^:]*?/])
    port = @server.address[/\d*$/]
    server = TF2Server.new(ip_address,port)
    @server.players = server.server_info[:number_of_players] - server.server_info[:number_of_bots]
    # Now, I'm not 100% sure how this works. server.server_info[:number_of_bots] would return the number of bots. Should we subtract that from the number of players? Or does it do that by default?
    # TODO: Figure out whether bots count
    @server.maxplayers = server.server_info[:max_players]
    @server.free_spots = @server.maxplayers - @server.players
    @server.map = server.server_info[:map_name]
    @server.name = server.server_info[:server_name]
    @server.tags = server.server_info[:server_tags]
    if not @server.save
      flash[:error]="Server cannot be reached for comment"
      redirect_to servers_index_path
    end
  end

  def update_all_servers
    @servers = Server.all
    @server.each do |server|
      update_server(server.id)
    end
  end

end
