class Shopdesigncomment < ActiveRecord::Base
    belongs_to :shopdesignimg 
    belongs_to :user
end
