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

  def show
    bank = Bank.find(params[:id])
  end

  def transfer
    bank = Bank.find(params[:bank])
  end

end

