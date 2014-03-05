class Tf2ServersController < ApplicationController

  before_filter :require_admin, except:[ :index, :show, :search ]
  before_filter :authenticate_user!, :except => [ :index, :search ]

  def index
    #update_all_tf2_servers
    @search = Tf2Server.search(params[:q])
    @tf2_servers = @search.result(distinct: true)
  end

  def new
    @tf2_server = Tf2Server.new
    @name_one = "RED_#{@tf2_server.id}"
    @name_two = "BLUE_#{@tf2_server.id}"
    @team_one = @tf2_server.teams.build(name: @name_one)
    @team_two = @tf2_server.teams.build(name: @name_two)
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
    #update_tf2_server(params[:id])
    @tf2_server = Tf2Server.find(params[:id])
    if @tf2_server.is_dedicated?
      @team_one = @tf2_server.teams.first
      @team_two = @tf2_server.teams.last

      @current_user_joined = false
      if not @team_one.users_teams.where(:user_id => current_user.id).blank? or not @tf2_server.teams.last.users_teams.where(:user_id => current_user.id).blank?
        @current_user_joined = true
      end

      @all_readied = true
      @users_teams = @team_one.users_teams
      @users_teams.push(@team_two.users_teams)
      @users_teams.each do |users_team|
        if users_team.ready = false
          @all_readied = false
        end
      end
      if @tf2_server.game == "highlander"
        if @users_teams.size != 18
          @all_readied = false
        end
      end
      if @tf2_server.game == "6v6"
        if @users_teams.size != 12
          @all_readied = false
        end
      end

      if @all_readied && @current_user_joined
        render 'start'
      end
      @current_user_readied = false
      if not @users_teams.where(:user_id => current_user.id).first.nil? and @users_teams.where(:user_id => current_user.id).first.ready
        @current_user_readied = true
      end
      @users_team = UsersTeam.new()
    end
  end

  def join
    @tf2_server = Tf2Server.find(params[:id])
    @users_team = UsersTeam.new(accepted: true, user_id: current_user.id, role: params[:role])
    if params[:team_color] == 'RED'
      @users_team.team_id = @tf2_server.teams.where(:name => "RED_#{@tf2_server.id}").first.id
    else
      @users_team.team_id = @tf2_server.teams.where(:name => "BLUE_#{@tf2_server.id}").first.id
    end
    if @users_team.save
      flash[:success] = 'Joined server'
    end
    render 'show'
  end

  def leave
    @tf2_server = Tf2Server.find(params[:id])
    @tf2_server.users_teams.where(:user_id => current_user.id).ready = true
  end

  def ready
    @tf2_server = Tf2Server.find(params[:id])
    @tf2_server.users_teams.where(:user_id => current_user.id).ready = true
    render 'show', :notice => "You are ready! The game will start when everyone is ready."
  end

  def start
    @tf2_server = Tf2Server.find(params[:id])
  end

  def destroy
    Tf2Server.find(params[:id]).destroy
    redirect_to tf2_servers_path
  end

  def search
    index
    render 'index'
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

  def users_team_params
    params.require(:users_team).permit(:role, :team_id)
  end

  def remove_team_color
    tmp_params = users_team_params
    tmp_params.delete :team_color
    return tmp_params
  end

  # Updatey stuff

  def update_tf2_server(id)
    @tf2_server = Tf2Server.find(id)

    ip_address = IPAddr.new(@tf2_server.address[/[^:]*/])
    port = @tf2_server.address[/\d*$/]
    server = SourceServer.new(ip_address,port)

    @tf2_server.players = server.server_info[:number_of_players] - server.server_info[:number_of_bots]
    @tf2_server.maxplayers = server.server_info[:max_players]
    @tf2_server.free_spots = @tf2_server.maxplayers - @tf2_server.players
    @tf2_server.map = server.server_info[:map_name]
    @tf2_server.name = server.server_info[:server_name]
    @tf2_server.tags = server.server_info[:server_tags]

    if not @tf2_server.save
      flash[:error]="Server cannot be reached for comment"
      redirect_to tf2_servers_index_path
    end
  end

  def update_all_tf2_servers
    servers = Tf2Server.all
    servers.each do |tf2_server|
      update_tf2_server(tf2_server.id)
    end
  end

end
