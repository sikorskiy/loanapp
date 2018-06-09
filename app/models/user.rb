class User < ApplicationRecord

    validates :name, :lastname, :email, {presence: true, length: {minimum: 2, maximum: 40}}
    validates :email, uniqueness: true
    has_many :loans
  validates :password, presence: true, length: {minimum: 6}
  has_secure_password

end
