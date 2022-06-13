class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @appointment = Appointment.new
    @doctor = Doctor.find(params[:doctor_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.save!
    redirect_to doctors_path
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
