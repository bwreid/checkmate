class BanksController < ApplicationController
  def index
  end

  def new
    @bank = Bank.new
  end

  def create
    Bank.create(params[:bank])
    @banks = Bank.order(:name)
  end

end

