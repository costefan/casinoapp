class HomePageController < ApplicationController
  def home
    @user = User.new
    @poker_tables = refresh_tables
  end

  def help
    @poker_table = PokerTable.new
  end

  def create_user
    @user = User.new( user_params )
    add_to_user_tables if params[:user][:poker_table_ids]
    if @user.save || find_error
      redirect_to help_url
    else
      @poker_tables = refresh_tables
      render 'home'
    end
  end

  def create_table
    @poker_table = PokerTable.new(table_params)
    @poker_table.save
    redirect_to root_url
  end

  private

  def refresh_tables
    PokerTable.where("start_date >   ?", Time.now) #ПОМЕНЯЙ НА ОБРАТНУЮ!
  end

  def add_to_user_tables
    assigned_tables = PokerTable.find( params[:user][:poker_table_ids] )
    @user.poker_tables = assigned_tables
  end

  def user_params #safe params
    params.require(:user).permit(:email)
  end

  def table_params
    params.require(:poker_table).permit(:name,:start_date)
  end

  def find_error
    @user.errors.full_messages.include?("Email has already been taken")
  end
end
