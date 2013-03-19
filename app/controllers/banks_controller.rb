class BanksController < ApplicationController
  def show
  end

  def deposit_info
    bank = Bank.find(params[:id])
    @deposits = bank.transactions.select{|x| x.is_deposit == true}
    @withdrawals = bank.transactions.select{|x| x.is_deposit == false}
  end
end