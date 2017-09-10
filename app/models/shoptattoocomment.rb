class Shoptattoocomment < ActiveRecord::Base
    belongs_to :shoptattooimg
    belongs_to :user
end
