class ImagesController < ApplicationController
  def profile
    profile = Tattooshop.find(params[:tattooshop_id])
    profile.update(profile_img:params[:image])
    redirect_to :back
  end
  def main_image
    Shopmainimg.create(image: params[:image],
                       tattooshop_id: params[:tattooshop_id])
    redirect_to :back
  end

  def shop_image
    Shopshopimg.create(image: params[:image],
                       tattooshop_id: params[:tattooshop_id],
                       title: params[:title])
    redirect_to :back
  end

  def tattoo_image
    Shoptattooimg.create(image: params[:image],
                         tattooshop_id: params[:tattooshop_id],
                         title: params[:title],
                         description: params[:description],
                         designer: params[:designer])
    redirect_to :back
  end
  
  def design_image
    Shopdesignimg.create(image: params[:image],
                        tattooshop_id: params[:tattooshop_id],
                        title: params[:title],
                        description: params[:description],
                        price: params[:price],
                        timespan: params[:timespan],
                        designer: params[:designer])
    redirect_to :back
  end
  
  def greeting
    exectshop = Tattooshop.find(params[:tattooshop_id])
    Greeting.create(content: params[:content],
                    tattooshop_id: params[:tattooshop_id],
                    hourlyprice: params[:hourlyprice],
                    openhour: params[:openhour])
    redirect_to :back
  end

  def fullmanages
      f = Fullmanage.new   
      f.tattooshop_id = params[:tattooshop_id]
      shop = Tattooshop.find(params[:tattooshop_id])
      fmanager = User.where(email: params[:user_id]).take
      if fmanager.is_tattooist
        f.user_id = fmanager.id
        f.save
        fmanager.update(belong: shop.shopname)
        redirect_to :back
      else
        redirect_to '/images/error'

      end
  end
  
  def limited 
      l = Limited.new
      l.tattooshop_id = params[:tattooshop_id]
      shop = Tattooshop.find(params[:tattooshop_id])
      lmanager = User.where(email: params[:user_id]).take
      if lmanager.is_tattooist
        l.user_id=lmanager.id
        l.save
        lmanager.update(belong: shop.shopname)
        redirect_to :back
      else
        redirect_to "/images/error"
      end
  end
  def error
    @message = "That user is not tattooist!"
  end

  def destroy_designimg
    Shopdesignimg.find(params[:shopdesignimg_id]).destroy
    redirect_to :back
  end
  
  def destroy_tattooimg
    Shoptattooimg.find(params[:shoptattooimg_id]).destroy
    redirect_to :back
  end
  
  def destroy_shopshopimg
    Shopshopimg.find(params[:shopshopimg_id]).destroy
    redirect_to :back
  end
  
  def update_designimg
      d = Shopdesignimg.find(params[:asd])
      d.image = params[:image]
      d.title = params[:title]
      d.description = params[:description]
      d.price = params[:price]
      d.timespan = params[:timespan]
      d.designer = params[:designer]
      d.save
      
      redirect_to :back
  end  

  def update_shopshopimg
      s = Shopshopimg.find(params[:ssi])
      s.image = params[:image]
      s.title = params[:title]
      s.save
      
      redirect_to :back
  end

  def update_tattooimg
      t = Shoptattooimg.find(params[:sti])
      t.image = params[:image]
      t.title = params[:title]
      t.description = params[:description]
      t.designer = params[:designer]
      t.save
      
      redirect_to :back
  end

end
