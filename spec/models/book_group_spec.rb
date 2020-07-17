require 'rails_helper'

RSpec.describe BookGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:group) }
  end
end
