class Shopdesignimg < ActiveRecord::Base
    belongs_to :tattooshop
    mount_uploader :image, AvatarUploader
    
    has_many :designlikes
    has_many :liked_users, through: :designlikes, source: :user
    
    has_many :shopdesigncomments, dependent: :destroy
    
    validates :image, presence: true
end
