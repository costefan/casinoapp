class HomePageController < ApplicationController
  def home
    @user = User.new
  end

  def help
  end

  def create_user
    @user = User.new(user_params)
    if @user.save

    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end
end
