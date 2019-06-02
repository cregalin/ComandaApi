class User < ApplicationRecord
    has_many :restaurant_manager
    validates :title, length: { maximum: 50 }, presence: true
    validates :password, length: { maximum: 100 }, presence: true
end
