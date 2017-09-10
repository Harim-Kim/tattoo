class LikeController < ApplicationController
    def follow
        followee = User.find(params[:id])
        current_user.follow(followee)
        redirect_to :back 
    end
    def unfollow
        followee = User.find(params[:id])
        current_user.stop_following(followee)
        redirect_to :back
    end
    
    def likeshop
        like = Shoplike.find_by(user_id: current_user.id,
                                tattooshop_id: params[:id])
        if like.nil?
            Shoplike.create(user_id: current_user.id,
                        tattooshop_id: params[:id])
        else
            like.destroy
        end
        redirect_to :back
    end
    
    def likedesign
        like = Designlike.find_by(user_id: current_user.id,
                                  shopdesignimg_id: params[:id])
        if like.nil?
            Designlike.create(user_id: current_user.id,
                        shopdesignimg_id: params[:id])
        else
            like.destroy
        end
        redirect_to :back
    end
    
    def likereview
        like = Reviewlike.find_by(user_id: current_user.id,
                                  review_id: params[:id])
        if like.nil?
            Reviewlike.create(user_id: current_user.id,
                        review_id: params[:id])
        else 
            like.destroy
        end
        redirect_to :back
        
    end
    
    def likeshoptattoo
        like = Shoptattoolike.find_by(user_id: current_user.id,
                                  shoptattooimg_id: params[:id])
        if like.nil?
            Shoptattoolike.create(user_id: current_user.id,
                        shoptattooimg_id: params[:id])
        else 
            like.destroy
        end
        redirect_to :back
        
    end
end
