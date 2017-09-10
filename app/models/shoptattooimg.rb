class Shoptattooimg < ActiveRecord::Base
    belongs_to :tattooshop
    mount_uploader :image, AvatarUploader
    
    has_many :shoptattoolikes
    has_many :liked_users, through: :shoptattoolikes, source: :user
    
    has_many :shoptattoocomments, dependent: :destroy
    validates :image, presence: true
end
