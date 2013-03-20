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

  def transfer
    @banks = Bank.all
  end

  def transfer_amt
    from = Bank.find(params[:from])
    to = Bank.find(params[:to])
    t1 = Transaction.create(amount:params[:amount], is_deposit:true, date:Date.current, notes:"deposit from #{from.name}")
    to.transactions << t1
    amt = params[:amount]
    t2 = Transaction.create(amount:(amt - (amt*2)), is_deposit:false, date:Date.current, notes:"transfer to #{to.name}")
    from.transactions << t2

  end

end

