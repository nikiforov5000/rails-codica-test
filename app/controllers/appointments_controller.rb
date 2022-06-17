class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    redirect_to "/"
  end

  def edit
  end

  def update
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date)
  end
  
end
