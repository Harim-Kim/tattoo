class MemberController < ApplicationController
    before_action :authenticate_user!
    def message
    end
    def help
    end
    def picture
    end
    def wishlist
        b= []
        current_user.shoplikes.each do |t|
            b.push(Tattooshop.find(t.tattooshop_id))
        end
        @likeshops=b
        
        c= []
        current_user.designlikes.each do |d|
            c.push(Shopdesignimg.find(d.shopdesignimg_id))
        end
        @likedesigns=c

    #   d= []
    #   current_user.follow.each do |f|
    #       f.push(User.find(f.user_id))
    #   end
    #   @follow=d
    end
 
 
    def follow
        a = User.find(params[:user_id])
        current_user.follow(a)
        redirect_to :back
    end
    def unfollow
        a = User.find(params[:user_id])
        current_user.stop_following(a)
        redirect_to :back
    end
end
