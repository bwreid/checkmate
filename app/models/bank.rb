# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer

class Bank < ActiveRecord::Base
  attr_accessible :name
  belongs_to :users
  has_many :transactions

  def balance
    balance = self.transactions.map(&:amount).sum
    return balance
  end
end
