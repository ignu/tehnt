class CampgroundsController < ApplicationController
  before_filter :get_campgrounds
  
  
  def index
  end 
  
  def show
    @campground = Campground.find(params[:id]) 
  end
  
  def list
    self.render("index")
  end
     
  def create
    Campground.create!(params[:campground])
    redirect_to '/'
  end 
  
  def destroy
    Campground.find(params[:id]).destroy
    redirect_to '/'
  end
  
  protected
  def get_campgrounds
    @campgrounds = Campground.all
  end
end
