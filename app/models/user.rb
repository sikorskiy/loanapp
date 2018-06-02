class User < ApplicationRecord
    validates :name, :lastname, :email, {presence: true, length: {minimum: 2, maximum: 40}} 
    validates :email, uniqueness: true
    has_many :loans
end
