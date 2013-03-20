class BanksController < ApplicationController
  def show
    @bank = Bank.find(params[:id])
  end

  def index
  end

  def deposit_info
    bank = Bank.find(params[:bank_id])
    @deposits = bank.transactions.select{|x| x.is_deposit == true}
    @withdrawals = bank.transactions.select{|x| x.is_deposit == false}
  end
end