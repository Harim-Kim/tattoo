class TattooshopsController < ApplicationController

    def new
    end
    
    def create
        lonlat= Geocoder.search(params[:address])
        
        Tattooshop.create(shopname: params[:shopname],
                          country: params[:country],
                          phonenumber: params[:phonenumber],
                          city: params[:city],
                          suburb: params[:suburb],
                          address: params[:address],
                          user_id: params[:user_id],
                          owner: params[:owner],
                          longitude: lonlat[0].longitude,
                          latitude: lonlat[0].latitude)
        redirect_to :back
    end
    
    def edit
        @tattooshop = Tattooshop.find(params[:tattooshop_id])
    end
    
    def update
        t = Tattooshop.find(params[:tattooshop_id])
        t.shopname = params[:shopname]
        t.country = params[:country]
        t.phonenumber = params[:phonenumber]
        t.city = params[:city]
        t.suburb = params[:suburb]
        t.address = params[:address]
        t.save
        
        redirect_to "tattooshop/#{t.id}"
    end
    
    def destroy
        @tattooshop = Tattooshop.find(params[:tattooshop_id])
        @tattooshop.destroy
        redirect_to "/"
    end
    
end

    