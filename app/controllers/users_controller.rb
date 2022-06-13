class UsersController < ApplicationController
  before_action :authenticate_user!

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
end
