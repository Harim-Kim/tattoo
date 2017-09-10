class Limited < ActiveRecord::Base
    belongs_to :tattooshop
    validates :user_id, uniqueness: true

end
