class Transaction < ActiveRecord::Base
  attr_accessible :amount, :notes, :tdate
end
