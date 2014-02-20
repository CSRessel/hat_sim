# TODO TODO TODO: this whole controller and its views

class TeamsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @team = Team.new
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
    @captained_teams = current_user.teams.references( :accepted ).where(accepted: { active: true }).where( :captain => current_user.id )
    @teams = current_user.teams.references( :accepted ).where(accepted: { active: true }).where( "captain != ?", current_user.id )
    @invitations = current_user.teams.references( :accepted ).where(accepted: { active: false })
  end

  def show
    @team = Team.find(params[:id])
    @confirmed_users = team.users.references( :accepted ).where(accepted: { active: true })
    @unconfirmed_users = team.users.references( :accepted ).where(accepted: { active: false })
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

  def teams_params
  end

end
