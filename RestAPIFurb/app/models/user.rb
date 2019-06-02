class User < ApplicationRecord
    has_many :restaurant_manager
    validates :title, maximum: 50, presence: true
    validates :password, maximum: 100, presence: true
end
