class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if user_signed_in?
      if current_user.is_tattooist
        if current_user.hourlyprice==nil
          redirect_to edit_user_registration_path
        end
      end
    end
    @shops = Tattooshop.page params[:page]
    @maplocation = Tattooshop.location(@shops).to_json.html_safe

  end
  def search
    if params[:search]
      @shopss = Tattooshop.search(params[:search])
      loc = params[:search].split[0]
      search_loc = Geocoder.search(loc)
      @wheremap_long = search_loc[0].longitude
      @wheremap_lat = search_loc[0].latitude
      @maplocation = Tattooshop.location(@shopss).to_json.html_safe
    else
      @shopss = []
      @maplocation = Tattooshop.location(@shopss).to_json.html_safe
    end
    
  end
  
  def shop_show
    @one_shop = Tattooshop.find(params[:shop_id])
    @ts =[]
    a=User.where(email:@one_shop.owner)
    @ts.push(a[0])
    fm = Fullmanage.where(tattooshop_id: @one_shop.id)
    fm.each do |f|
      fm_user = User.find(f.user_id)
      @ts.push(fm_user)
    end
    lm = Limited.where(tattooshop_id: @one_shop.id)
    lm.each do |l|
      lm_user = User.find(l.user_id)
      @ts.push(lm_user)
    end
    @shop_tattooist=[]
    @ts.each do |ts|
      @shop_tattooist.push(ts.nick_name)
    end
    @reviews = Review.where(tattooshop_id:@one_shop.id).page(params[:page]).per(10)
  end
  def widhlist
    b = []
    current_user.shoplikes.each do |t|
      b.push(Tattooshop.find(t.tattooshop_id))
    end
    @likeshops=b
  end

end
