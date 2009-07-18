class CampgroundsController < ApplicationController
  before_filter :get_campgrounds
  
  
  def index
    self.render("list")
  end 
  
  def show
    @campground = Campground.find(params[:id])
    
  end
  
  def list
    self.render("list")
  end
      
  
  protected
  def get_campgrounds
    @campgrounds = Campground.all
  end
end
