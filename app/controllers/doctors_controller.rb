class DoctorsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @doctors = Doctor.all
    @user = current_user
  end
end
