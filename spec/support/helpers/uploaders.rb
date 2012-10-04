module UploaderHelpers
  def file_fixture
    CarrierWave::SanitizedFile.new(File.join(Rails.root, "spec/fixtures/ruby.deb"))
  end
end

module UploaderMacros
  def stub_uploader
    before do
      CarrierWave::Mount::Mounter.any_instance.stub(:store!)
      CarrierWave::Mount::Mounter.any_instance.stub(:remove!)
      FileUploader.any_instance.stub(:download!)
      Package.any_instance.stub(:store_file!)
    end
  end
end

RSpec.configure do |config|
  config.include UploaderHelpers
  config.extend UploaderMacros
end
