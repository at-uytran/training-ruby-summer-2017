# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text(65535)
#  image      :string(255)
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# nothing
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
