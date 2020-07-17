class Book < ApplicationRecord
  belongs_to :user
  has_many :book_groups
  has_many :groups, through: :book_groups
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :author, presence: true, length: { minimum: 3, maximum: 30 }
  validates :number_of_pages, presence: true
  validates :description, presence: true, length: { minimum: 10, maxmimum: 300 }
  mount_uploader :image, ImageUploader
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
