# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  birthday        :date
#  gender          :integer
#  password_digest :string(255)
#  user_name       :string(255)
#  avatar          :string(255)
#  provider        :string(255)
#  uid             :string(255)
#  role            :integer          default("member")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
