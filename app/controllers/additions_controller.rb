class AdditionsController < ApplicationController
  def new
#   account = Account.find(params[current_user.id])
    @user = current_user
    @addition = @user.account.additions.build
  end

  def create
    @addition = Addition.new(params[:addition])
    @user = current_user
    @amount = Amount.find(params[:addition][:amount_id])
    if @addition.payment(@user, @amount)
      redirect_to @user, :notice => "Thanks dawg"
    else
      render :new
    end
  end

  def show
    @addition = Addition.find(params[:id])
  end
  
  def index
    @user = current_user
    @additions = current_user.additions
  end
end
