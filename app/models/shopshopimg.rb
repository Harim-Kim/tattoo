class Shopshopimg < ActiveRecord::Base
    belongs_to :tattooshop
    mount_uploader :image, AvatarUploader
    validates :image, presence: true
end
