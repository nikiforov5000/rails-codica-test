class DoctorsController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]
  before_action :authenticate_doctor!, only: [ :show ]

  def show
    @doctor = current_doctor
    @future_appointments = @doctor.appointments.where("date > ?", Time.now)
    @past_appointments = @doctor.appointments.where("date < ?", Time.now).order(:date)
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
