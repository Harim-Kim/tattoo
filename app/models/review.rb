class Review < ActiveRecord::Base
    belongs_to :tattooshop
    has_many :rereviews, dependent: :destroy
    belongs_to :user
    
   has_many :reviewlikes
   has_many :liked_users, through: :reviewlikes, source: :user
    
end
