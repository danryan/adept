require 'spec_helper'

describe Repository do
  before do
    create(:apt_repository, type: 'Apt')
  end

  context 'validations' do
    it 'has a valid factory' do
      build(:repository).should be_valid
    end

    it { should validate_uniqueness_of(:name).scoped_to(:type, :user_id) }
  end
end
