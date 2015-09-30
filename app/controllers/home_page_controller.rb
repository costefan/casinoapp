class HomePageController < ApplicationController
  def home
    @user = User.new
    @poker_tables = PokerTable.where("start_date < ?", Time.now)
  end

  def help
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to help_url
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end
end
