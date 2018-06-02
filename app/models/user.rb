class User < ApplicationRecord
    validates :name, :lastname, :email, presence: true, length: {minimum: 2, maximum: 40}
    has_many :loans
end
