class BanksController < ApplicationController

  def index
  end

  def new
    @bank = Bank.new
  end

  def create
    bank = Bank.create(params[:bank])
    @auth.banks << bank
    @banks = @auth.banks.order(:name)
  end

  def transfer
    @banks = @auth.banks.order(:name)
  end

  def transfer_amt
    amt = params[:amount].to_f
    from = Bank.find(params[:from])
    to = Bank.find(params[:to])
    if from.balance > amt
      t1 = Transaction.create(amount:params[:amount].to_f, is_deposit:true, tdate:Date.current, notes:"deposit from #{from.name}")
      to.transactions << t1
      t2 = Transaction.create(amount:(amt - (amt*2)), is_deposit:false, tdate:Date.current, notes:"transfer to #{to.name}")
      from.transactions << t2
      @message = "You have successfully transferred money between banks"
    else
      @message = "You did not have enough money in #{from.name} to transfer $#{amt}"
    end
    @banks = @auth.banks.order(:name)
  end

  def show
    @bank = Bank.find(params[:id])
    @deposits = @bank.transactions.select{|x| x.is_deposit == true}
    @withdrawals = @bank.transactions.select{|x| x.is_deposit == false}
  end


  def deposit_info
    bank = Bank.find( params[:id] )
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
