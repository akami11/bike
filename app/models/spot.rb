class Spot < ApplicationRecord
  belongs_to :article

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
