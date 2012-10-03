require 'spec_helper'

describe Package do
  stub_uploader

  before do
    create(:package_with_distribution, file: file_fixture)
  end

  context 'associations' do
    it { should belong_to(:repository) }
    it { should have_many(:references) }
    it { should have_many(:distributions).through(:references) }
  end

  context 'validations' do
    it 'has a valid factory' do
      build(:package).should be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:component) }
    it { should validate_presence_of(:file) }

  end

  context 'mass assignment' do

  end
end
