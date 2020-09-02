class Dimension < ApplicationRecord
    belongs_to :user
    #has_many :bookings


    validates :name, presence: true
    #validates :description, presence: true
    #validates :booking_id, uniqueness: { scope: :dimension_id }
end 
