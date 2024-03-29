class ReviewsController < ApplicationController
  
  # DISCLAIMER: This is all stuff that Rails generated. It's probably wrong.

  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params.merge(user_id: current_user.id))
    if @review.save
      flash[:success] = 'Review created!'
      redirect_to tf2_servers_path
    else
      render 'new'
    end
  end


  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    #params[:review]
    params.require(:review).permit(:title, :content, :tf2_server_id, :rating_administration, :rating_speed, :rating_reliability, :rating_other,)
  end
end
