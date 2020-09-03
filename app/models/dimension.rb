class Dimension < ApplicationRecord
    belongs_to :user
    has_many :bookings, dependent: :destroy
    has_one_attached :photo


    validates :name, presence: true
    #validates :description, presence: true
    #validates :booking_id, uniqueness: { scope: :dimension_id }
end 
