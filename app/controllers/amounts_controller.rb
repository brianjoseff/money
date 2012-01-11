class AmountsController < ApplicationController
  def index
    @amounts = Amount.all
  end
end