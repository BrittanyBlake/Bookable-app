require 'rails_helper'

RSpec.describe Group, type: :model do
  subject {FactoryBot.build(:group)}

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:book_groups) }
    it { should have_many(:books).through(:book_groups) }
  end
end
