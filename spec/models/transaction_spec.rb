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

require 'spec_helper'

describe Transaction do
  pending "add some examples to (or delete) #{__FILE__}"
end
