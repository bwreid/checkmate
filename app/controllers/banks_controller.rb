class BanksController < ApplicationController
  def show
    @bank = Bank.find(params[:id])
  end

  def deposit_info
    bank = Bank.find(params[:id])
    @deposits = bank.transactions.select{|x| x.is_deposit == true}
  end

  def deposit_chart
    bank = Bank.find(params[:id])
    deposits = bank.transactions.select{|x| x.is_deposit == true}
    render :json => deposits
  end

  def withdrawal_chart
    bank = Bank.find(params[:id])
    withdrawals = bank.transactions.select{|x| x.is_deposit == false}
    render :json => withdrawals
  end

  def withdrawal_info
    bank = Bank.find(params[:id])
    @withdrawals = bank.transactions.select{|x| x.is_deposit == false}
  end
end
