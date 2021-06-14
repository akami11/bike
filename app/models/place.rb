class Place < ApplicationRecord
  has_many :articles,dependent: :destroy
end
