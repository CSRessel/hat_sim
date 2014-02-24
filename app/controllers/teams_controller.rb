class TeamsController < ApplicationController
  # TODO: finish this controller

  before_filter :authenticate_user!

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
      render :action => 'edit'
    end
  end

  def join_team
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    if Team.where(:id => params[:id]).captain == current_user.id || current_user.try(:admin?)
      @team.destroy
      render 'index'
    else
      redirect_to teams_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :game, users_teams_attributes: [:id, :user_id, :team_id, :role, :_destroy])
  end

end
