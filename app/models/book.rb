class Book < ApplicationRecord
    belongs_to :user
    scope :most_recent, -> { order(created_at: :desc) }
    validates :title, presence: true, length: {minimum: 3, maximum: 30}
    validates :author, presence: true, length: {minimum: 3, maximum: 30}
    validates :number_of_pages, presence: true, length: {minimum: 50, maximum: 5000}
    mount_uploader :image, ImageUploader
    
end
