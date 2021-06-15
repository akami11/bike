class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy
  belongs_to :place, optional: true
  
  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
