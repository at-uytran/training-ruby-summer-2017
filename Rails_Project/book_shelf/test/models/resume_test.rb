# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  attachment :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
