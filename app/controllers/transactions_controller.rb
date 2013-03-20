class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    bank = Bank.find( params[:bank_id])
    transaction = Transaction.new( params[:transaction] )
    if (transaction.is_deposit == false)
      if bank.balance > params[:transaction][:amount].to_f
        transaction.amount = ( params[:transaction][:amount].to_f )
        transaction.amount *= -1
        transaction.save
        @message = "You have successfully made a withdrawal from #{bank.name}"
        bank.transactions << transaction
      else
        @message = "You did not have enough money in your #{bank.name} account to make a withdrawal of $#{params[:transaction][:amount]}"
      end
    else
      transaction.save
      @message = "You have successfully made a deposit into #{bank.name}"
      bank.transactions << transaction
    end
    @deposits = bank.transactions.select{|x| x.is_deposit == true}
    @withdrawals = bank.transactions.select{|x| x.is_deposit == false}
    @bank = Bank.find( params[:bank_id])
  end
end
