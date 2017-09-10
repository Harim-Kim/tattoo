class Tattooshop < ActiveRecord::Base
    has_many :shopmainimgs, dependent: :destroy
    has_many :shopshopimgs, dependent: :destroy
    has_many :shoptattooimgs, dependent: :destroy
    has_many :shopdesignimgs, dependent: :destroy
    has_many :greetings, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :fullmanages, dependent: :destroy
    has_many :limiteds, dependent: :destroy
    belongs_to :user

    mount_uploader :profile_img, AvatarUploader
   
    has_many :shoplikes
    has_many :liked_users, through: :likes, source: :user

    def self.search(query)
        self.where("country || suburb || city || address LIKE ?","%#{query}%")
    end    
    def self.location(s)
        location =[]
        all = s
        all.each do |i|
             location.push([i.shopname,i.latitude, i.longitude, i.address])
        end
        return location
    end
end
