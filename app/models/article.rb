class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy
  belongs_to :places
end
