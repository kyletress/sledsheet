class AthletesController < ApplicationController

  before_action :admin_user, only: [:new, :edit, :update]
  before_action :load_athlete, only: [:update, :show, :edit, :destroy]

  def index
    @athletes = Athlete.page params[:page]
  end

  def show
    @season = Season.current_season
    @points = @athlete.season_positions(@season)
    @total_points = @athlete.current_season_points
    @races = @athlete.timesheets.includes(:track).where(race: true)
    render layout: "athlete"
  end

  def new
    @athlete = Athlete.new
    @genders = Athlete.genders
  end

  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      flash[:success] = "Athlete created."
      redirect_to @athlete
    else
      render 'new'
    end
  end

  def edit
    @genders = Athlete.genders
  end

  def update
    if @athlete.update_attributes(athlete_params)
      flash[:success] = "Athlete updated."
      redirect_to @athlete
    else
      render 'edit'
    end
  end

  def destroy
    @athlete.destroy
    flash[:success] = "Athlete deleted."
    redirect_to athletes_url
  end

  def typeahead
    render json: Athlete.where('last_name ilike ?', "%#{params[:q]}%")
    # render json: Athlete.where('((athletes.first_name || ' ' || athletes.last_name) ILIKE ?) OR (athletes.first_name ILIKE ?) OR (athletes.last_name ILIKE ?)', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
  end

  def search
    render json: Athlete.where('last_name ilike ?', "%#{params[:q]}%")
  end

  def career_medals
    @medalists = Athlete.career_medal_table
  end

  private

    def athlete_params
      params.require(:athlete).permit(:first_name, :last_name, :country_code, :male, :gender, :avatar, :remote_avatar_url)
    end

    def load_athlete
      @athlete = Athlete.friendly.find(params[:id])
    end

end
