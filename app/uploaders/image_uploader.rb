class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # thumb バージョン(width 400px x height 200px)
  version :thumb do
    process :resize_to_fit => [400, 200]
  end

end
