class Activity < ApplicationRecord
    # will destroy associated signups when activity is destroyed
    has_many :signups, dependent: :destroy
    has_many :campers, through: :signups

end
