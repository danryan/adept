module ControllersHelpers
  def file_fixture
    CarrierWave::SanitizedFile.new(File.join(Rails.root, "spec/fixtures/ruby.deb"))
  end
end
