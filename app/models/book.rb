class Book < ApplicationRecord
    has_many :book_groups
    has_many :groups, through: :book_groups
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3, maximum: 30}
    validates :author, presence: true, length: {minimum: 3, maximum: 30}
    validates :number_of_pages, presence: true
    mount_uploader :image, ImageUploader
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
    
end
