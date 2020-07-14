class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: { minimum: 3, maximum: 50 }
  validates :username, uniqueness: true
  has_many :books
  has_many :groups
  mount_uploader :image, ImageUploader
end
