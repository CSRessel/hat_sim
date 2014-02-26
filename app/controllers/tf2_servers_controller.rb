class Tf2ServersController < ApplicationController

  before_filter :require_admin, except:[ :index, :show, :search ]
  before_filter :authenticate_user!, :except => [ :index, :search ]

  def index
    update_all_tf2_servers
    @search = Tf2Server.search(params[:q])
    @tf2_servers = @search.result(distinct: true)
  end

  def new
    @tf2_server = Tf2Server.new
  end

  def create
    @tf2_server = Tf2Server.new(remove_passwd_conf)
    if tf2_server_params[:password] == tf2_server_params[:password_confirmation]
      if @tf2_server.save
        flash[:success] = 'Server created!'
        redirect_to tf2_servers_path
      else
        render 'new'
      end
    else
      @tf2_server.errors[:password_confirmation] = 'must match password'
      render 'new'
    end
  end

  def show
    update_tf2_server(params[:id])
    @tf2_server = Tf2Server.find(params[:id])
  end

  def destroy
    Tf2Server.find(params[:id]).destroy
    redirect_to tf2_servers_path
  end

  def search
    index
    render :index
  end

  private

  def tf2_server_params
    params.require(:tf2_server).permit(:address, :name, :password, :password_confirmation, :tags, :region, :dedicated, :game)
    #params.require(:tf2_server).permit(:address, :name, :password, :tags, :region, :dedicated, :game)
  end

  def remove_passwd_conf
    tmp_params = tf2_server_params
    tmp_params.delete :password_confirmation
    return tmp_params
  end

  # Updatey stuff

  def update_tf2_server(id)
    @tf2_server = Tf2Server.find(id)
    ip_address = IPAddr.new(@tf2_server.address[/[^:]*?/])
    port = @tf2_server.address[/\d*$/]
    tf2_server = TF2Server.new(ip_address,port)
    @tf2_server.players = tf2_server.server_info[:number_of_players] - tf2_server.server_info[:number_of_bots]
    # Now, I'm not 100% sure how this works. tf2_server.server_info[:number_of_bots] would return the number of bots. Should we subtract that from the number of players? Or does it do that by default?
    # TODO: Figure out whether bots count
    @tf2_server.maxplayers = tf2_server.server_info[:max_players]
    @tf2_server.free_spots = @tf2_server.maxplayers - @tf2_server.players
    @tf2_server.map = tf2_server.server_info[:map_name]
    @tf2_server.name = tf2_server.server_info[:server_name]
    @tf2_server.tags = tf2_server.server_info[:server_tags]
    if not @tf2_server.save
      flash[:error]="Server cannot be reached for comment"
      redirect_to tf2_servers_index_path
    end
  end

  def update_all_tf2_servers
    @tf2_servers = Tf2Server.all
    @tf2_server.each do |tf2_server|
      update_tf2_server(tf2_server.id)
    end
  end

end
