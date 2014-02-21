class TeamsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @team = Team.new
    1.times do
      user_team = @team.user_teams.build
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
    @captained_teams = Team.captained_by(current_user)
    @teams = Team. accepted_by(current_user)
    @invitations = Team.pending_action_from(current_user)
  end

  def show
    @team = Team.find(params[:id])
    @confirmed_users = User.is_member_of(@team)
    @unconfirmed_users = User.is_invited_to(@team)
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
    params.require(:team).permit(:name, :game, user_teams_attributes: [:id, :user_id, :role, :_destroy])
  end

end
