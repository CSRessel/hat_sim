class TeamsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :require_captain_or_admin, only:[ :edit, :update, :destroy ]
  before_filter :require_membership, only:[ :show, :join, :reject ]

  def new
    @team = Team.new
    users_team = @team.users_teams.build(user_id: current_user.id, accepted: true)
    1.times do
      users_team = @team.users_teams.build
      users_team.accepted = false
    end
  end

  def create
    @team = Team.new(team_params)
    #Rails.logger.info(team_params.to_yaml)
    #Rails.logger.info(@team.to_yaml)
    @team.captain = current_user.id
    if @team.save
      flash[:success] = 'Team created'
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def index
    @captained_teams = Team.has_captain(current_user)
    @teams = Team.has_member(current_user)
    @invitations = Team.has_invited(current_user)
  end

  def show
    @team = Team.find(params[:id])
    @confirmed_users = User.is_member_of(@team)
    @unconfirmed_users = User.is_invited_to(@team)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      redirect_to @team, :notice  => "Successfully updated team."
    else
      render 'edit'
    end
  end

  def join
    @team = Team.find(params[:id])
    @membership = UsersTeam.where(:team_id => @team.id).where(:user_id => current_user.id).first
    @membership.accepted = true
    if @membership.save
      redirect_to @team, :notice  => "Successfully joined team."
    else
      redirect_to teams_path
    end
  end

  def reject
    @team = Team.find(params[:id])
    @membership = UsersTeam.where(:team_id => @team.id).where(:user_id => current_user.id).first
    @membership.destroy
    redirect_to teams_path
  end

  def kick_member
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.captain == current_user.id || current_user.try(:admin?)
      @team.destroy
    end
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :game, users_teams_attributes: [:id, :user_id, :team_id, :role, :_destroy])
  end

  def require_membership
    @team = Team.find(params[:id])
    @membership = UsersTeam.where(:team_id => @team.id).where(:user_id => current_user.id).first
    if @membership.nil? and current_user.id!=@team.captain
      redirect_to root_path
    end
  end

  def require_captain_or_admin
    @team = Team.find(params[:id])
    if current_user.id != @team.captain
      if not current_user.try(:admin?)
        redirect_to root_path
      end
    end
  end

end
