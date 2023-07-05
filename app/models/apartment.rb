class Apartment < ApplicationRecord
    belongs_to :user
    validates :bedrooms, :bathrooms, :unit, :city, :state, :square_footage, :price, :pets, :image, :user_id, :street, presence: true
end
