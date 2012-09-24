require 'spec_helper'

describe String do
  describe '#to_dpkg_field' do
    it 'turns snake_case strings into dpkg-compatible fields' do
      "foo".to_dpkg_field.should == "Foo"
      "foo_bar".to_dpkg_field.should == "Foo-Bar"
      "foo_bar_baz".to_dpkg_field.should == "Foo-Bar-Baz"
      "FOo-bAr_BAZ".to_dpkg_field.should == "Foo-Bar-Baz"
    end

    it 'does not modify the original string' do
      str = "foo_bar_baz"
      str.to_dpkg_field
      str.should == "foo_bar_baz"
    end
  end

  describe '#to_dpkg_field!' do
    it 'modifies the original string' do
      str = 'foo_bar_baz'
      str.to_dpkg_field!
      str.should == "Foo-Bar-Baz"
    end
  end
end