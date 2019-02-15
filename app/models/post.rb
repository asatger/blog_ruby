class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :image, PhotoUploader
    acts_as_commontable
end
