require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:books) }
    it { should have_many(:groups) }
  end
end
