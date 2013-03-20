class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    bank = Bank.find( params[:bank_id])
    transaction = Transaction.new( params[:transaction] )

    if (transaction.is_deposit == false)
      transaction.amount = ( params[:transaction][:amount].to_i )
      transaction.amount *= -1
      transaction.save
    else
      transaction.save
    end

    bank.transactions << transaction
  end
end