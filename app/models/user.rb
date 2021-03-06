# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :username
  validates :username, :presence => true, :uniqueness => true
  has_many :banks
  has_secure_password
end
