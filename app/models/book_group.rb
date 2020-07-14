class BookGroup < ApplicationRecord
  belongs_to :book
  belongs_to :group
end
