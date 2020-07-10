class Book < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3, maximum: 30}
    validates :author, presence: true, length: {minimum: 3, maximum: 30}
    validates :number_of_pages, presence: true, length: {minimum: 50, maximum: 5000}
    
end
