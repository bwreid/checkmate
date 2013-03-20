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

require 'spec_helper'

describe User do
  describe '.create' do
    it 'should save a new user object to the database' do
      User.create( username: 'x', password: 'x', password_confirmation: 'x' )
      User.first.username.should eq 'x'
    end
  end
end
