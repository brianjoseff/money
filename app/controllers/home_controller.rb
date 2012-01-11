class HomeController < ApplicationController
  def index
    if current_user
      @user = current_user
    else
      @user = User.new
    end
  end
end