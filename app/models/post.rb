class Post < ApplicationRecord
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_one_attached :photo
end
