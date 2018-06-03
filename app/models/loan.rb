class Loan < ApplicationRecord
    belongs_to :user
    validates :user, :sum, :term, presence: true
end
