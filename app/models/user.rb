class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
  
  validates :name, length: { maximum: 50 }
  
  # carrierwave
  mount_uploader :avatar, AvatarUploader
  
  # フォロー機能
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :follower, source: :followed
  has_many :followers, through: :followed, source: :follower
  
  def follow(other_user)
    following << other_user
  end
end
