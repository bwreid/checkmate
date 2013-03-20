class AddDepositsBankIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :bank_id, :integer
    add_column :transactions, :is_deposit, :boolean
  end
end
