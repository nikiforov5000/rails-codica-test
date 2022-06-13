class DoctorsController < ApplicationController

  def show
    @doctor = current_doctor
    @appointments = @doctor.appointments.where(open: true)
  end

  def new
  end

  def create
  end

  def index
    @categories = Category.all
    if params[:query].present?
      @doctors = Doctor.where(category_id: params[:query])
      
    else
      @doctors = Doctor.all
    end
    @user = current_user
  end

end
