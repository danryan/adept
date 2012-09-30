require 'spec_helper'

describe Distribution do
  before do
    create(:repository_with_distributions)
  end

  context 'associations' do
    it { should belong_to(:repository) }
    it { should have_many(:packages).through(:references) }
    it { should have_many(:references) }
  end

  context 'validations' do
    it 'has a valid factory' do
      build(:lucid).should be_valid
    end

    it { should validate_presence_of :codename }
    it { should validate_presence_of :description }
    it { should validate_presence_of :origin }
    it { should validate_presence_of :label }
    it { should validate_presence_of :architecture_list }
    it { should validate_presence_of :component_list }
    it do
      should validate_format_of(:origin).
        with('apt.example.com').
        with_message(/is not a valid FQDN/)
    end
    it do
      should validate_format_of(:origin).
        not_with('foo bar baz').
        with_message(/is not a valid FQDN/)
    end
    it do
      should validate_uniqueness_of(:codename).
        scoped_to(:repository_id).
        with_message(/has already been taken/)
    end

  end

  context 'mass assignment' do
    it { should_not allow_mass_assignment_of(:repository) }
    it { should allow_mass_assignment_of(:codename) }
    it { should allow_mass_assignment_of(:description) }
    it { should allow_mass_assignment_of(:origin) }
    it { should allow_mass_assignment_of(:label) }
    it { should allow_mass_assignment_of(:architecture_list) }
    it { should allow_mass_assignment_of(:component_list) }
  end
end
