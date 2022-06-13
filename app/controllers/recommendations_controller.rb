class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
    @appointment = Appointment.find(params[:appointment_id])
    @doctor = @appointment.doctor
    @user = @appointment.user
  end
  
  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.appointment = Appointment.find(params[:appointment_id])
    @recommendation.appointment.update(open: false)
    @recommendation.save!
    redirect_to current_doctor
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:comment)
  end

end
