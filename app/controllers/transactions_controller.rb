class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    bank = Bank.find( params[:bank_id])
    bank.transactions << Transaction.create( params[:transaction] )
  end
end