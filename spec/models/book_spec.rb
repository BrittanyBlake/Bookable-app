require 'rails_helper'

RSpec.describe Book, type: :model do
  subject {FactoryBot.build(:book)}

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_length_of(:author) }
    it { should validate_presence_of(:number_of_pages) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:book_groups) }
    it { should have_many(:groups).through(:book_groups) }
  end
  
end
