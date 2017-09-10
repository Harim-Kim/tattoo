class ReviewController < ApplicationController
    protect_from_forgery :except => [:update, :write_review]
    def write_review
        Review.create(content: params[:content],
                      user_id: current_user.id,
                      tattooshop_id: params[:tattooshop_id])
        redirect_to :back
        
        
    end

    def edit
        @review = Review.find(params[:review_id])
    end
    
    def update
        r = Review.find(params[:review_id])
        r.title = params[:title]
        r.content = params[:content]
        r.save
        
        redirect_to :back
    end
    
    def destroy
        @review = Review.find(params[:review_id])
        @review.destroy
        redirect_to :back
    end
    
    def write_rereview
        Rereview.create(content: params[:content],
                        user_id: params[:user_id],
                        review_id: params[:review_id])
        redirect_to :back
    end
    
    def write_shoptattoocomment
        Shoptattoocomment.create(content: params[:content],
                          user_id: params[:user_id],
                          shoptattooimg_id: params[:shoptattooimg_id])
        redirect_to :back
    end

    def write_shopdesigncomment
        Shopdesigncomment.create(content: params[:content],
                          user_id: params[:user_id],
                          shopdesignimg_id: params[:shopdesignimg_id])
        redirect_to :back
    end

end
