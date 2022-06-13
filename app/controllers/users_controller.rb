class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments.order(open: :desc)
  end

  def full_name
    return "FULL NAME"
  end
end
