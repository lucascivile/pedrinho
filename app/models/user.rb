class User < ApplicationRecord
    validates :full_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
end
