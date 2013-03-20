# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  tdate      :date
#  amount     :decimal(, )
#  notes      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bank_id    :integer
#  is_deposit :boolean
#

class Transaction < ActiveRecord::Base
  attr_accessible :amount, :notes, :tdate, :is_deposit
  belongs_to :bank
end
