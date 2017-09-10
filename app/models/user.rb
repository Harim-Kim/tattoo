class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    mount_uploader :image, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :tattooshops, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :rereviews, dependent: :destroy
  
  validates_presence_of   :image
  validates_integrity_of  :image
  validates_processing_of :image
  
  has_many :shoptattoocomments, dependent: :destroy
  has_many :shopdesigncomments, dependent: :destroy
  acts_as_followable
  acts_as_follower
  has_many :reviewlikes
  has_many :liked_reviews, through: :reviewlikes, source: :review
  has_many :designlikes
  has_many :liked_shopdesignimgs, through: :designlikes, source: :shopdesignimg
  has_many :shoplikes
  has_many :liked_tattooshops, through: :shoplikes, source: :tattooshops
  has_many :shoptattoolikes
  has_many :liked_shoptattooimgs, through: :shoptattoolikes, source: :shoptattooimg
  def is_likereview?(r)
    Reviewlike.find_by(user_id: self.id,
                       review_id: r.id).present?
  end
  def is_likeshop?(s)
    Shoplike.find_by(user_id: self.id,
                     tattooshop_id: s.id).present?
  end
  def is_likedesign?(d)
    Designlike.find_by(user_id: self.id,
                       shopdesignimg_id: d.id).present?
  end

  def is_likeshoptattoo?(t)
    Shoptattoolike.find_by(user_id: self.id,
                       shoptattooimg_id: t.id).present?
  end                   
end
