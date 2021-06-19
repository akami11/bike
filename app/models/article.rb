class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy
  belongs_to :place, optional: true
  
  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end
  # 画像投稿
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  
  # 動画投稿
  mount_uploader :video, VideoUploader
  # タグ機能の追加
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  # gooogleMap
  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot
end
