class ReservationsController < ApplicationController    
  before_filter :find_campground
  before_filter :get_week_and_year
  
  def index
    @campsites = @campground.campsites(:include => 'reservations')
    
  end 
  
  def show
    
  end
  
  protected
  
  def find_campground
    @campground = Campground.find(params[:campground_id])  
  end                                                    
  def get_week_and_year
    @month = params[:month]
    @day = params[:day]
    @year = params[:year]    
  end
end
