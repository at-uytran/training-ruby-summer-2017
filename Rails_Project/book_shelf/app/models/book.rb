# == Schema Information
#
# Table name: books
#
#  id     :integer          not null, primary key
#  name   :string(255)
#  author :string(255)
#  title  :string(255)
#  isn    :string(255)
#
# nodoc:
class Book < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  # mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      scoped
    end
  end

  scope :author_search, ->(author) { where(['author LIKE ?', "%#{author}%"]) }
  scope :search_author, lambda { |author_name|
    joins(:order).where('books.author like :authorname', authorname: author_name)
  }
  has_many :orders
  has_many :carts, through: :orders
  has_many :comments
end
