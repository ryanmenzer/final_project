# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :avatar do
    process :resize_to_fill => [120, 120, gravity = "North" ]
  end

  version :square do
    process :resize_to_fill => [120, 120, gravity = "Center" ]
  end

  version :small do
    process :resize_to_limit => [400, 400]
  end

  version :medium do
    process :resize_to_limit => [800, 800]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
