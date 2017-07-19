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

class Resume < ApplicationRecord
   mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :name, presence: true # Make sure the owner's name is present.
end
