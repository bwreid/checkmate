class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :tdate
      t.decimal :amount
      t.string :notes

      t.timestamps
    end
  end
end
