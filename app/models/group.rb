class Group < ApplicationRecord
    has_many :book_groups
    has_many :books, through: :book_groups
    belongs_to :user
end
