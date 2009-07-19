class CampgroundsController < ApplicationController
  before_filter :get_campgrounds
  
  
  def index
    self.render("list") 
  end 
  
  def show
    @campground = Campground.find(params[:id]) 
  end
  
  def list
  end 
  
  def new
    @campground = Campground.new
    render "edit"
  end
  
  def edit
    @campground = Campground.find(params[:id])
    
  end 
  def update 
    @campground = Campground.find(params[:id]) 
    @campground.update_attributes(params[:campground])
    redirect_to '/campgrounds'
    
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
