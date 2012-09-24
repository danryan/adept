# encoding: utf-8
require 'carrierwave/processing/mime_types'

class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes

  storage :fog

  process :set_content_type

  def store_dir
    path = Pathname.new('apt')
    path += 'pool'
    path += model.component

    name = model.source || model.package
    if name =~ /^lib/
      path += name[0..3]
    else
      path += name[0]
    end
    path += name

    path.to_s
  end

  def extension_white_list
    %w[ deb ]
  end

end
