class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:show]

  def show
    @user = current_user
  end

  def index
    @users = User.all
  end
end
