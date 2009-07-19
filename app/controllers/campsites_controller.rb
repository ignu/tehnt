class CampsitesController < ApplicationController
  def new 
    @campsite = Campsite.new
    @campgrounds = Campground.all
    render "edit"    
  end

  def edit
    @campsite = Campsite.find self.params[:id]
    @campgrounds = Campground.all
  end

  def save       
    @campsite = Campsite.new(self.params[:campsite])    
    @campsite.save!
    redirect_to '/campsites/new'        
  end

  def index
    @campsites = Campsite.all
  end
  
end
    