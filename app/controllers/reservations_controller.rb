class ReservationsController < ApplicationController    
  before_filter :find_campground, :only => [:index]
  before_filter :get_start_date
  before_filter :get_end_date
  
  def index
    @campsites = @campground.campsites(:include => 'reservations')
    
  end 
  
  def show
    
  end
  
  def new
    
  end
  
  protected
  
  def find_campground
    @campground = Campground.find(params[:campground_id])  
  end                                                    
  def get_start_date
    logger.info "#{params[:s_year]}, #{params[:s_month]}, #{params[:s_day]}"
    @start_date = "#{params[:s_year]}-#{params[:s_month]}-#{params[:s_day]}".to_date
    logger.info "Start date = #{@start_date}"
     # Date.new(params[:s_year], params[:s_month], params[:s_day])   
  end 
  def get_end_date 
    logger.info "#{params[:e_year]}, #{params[:e_month]}, #{params[:e_day]}"
    @end_date = "#{params[:e_year]}-#{params[:e_month]}-#{params[:e_day]}".to_date
    logger.info "End date = #{@end_date}"
    # @end_date = Date.new(params[:e_year], params[:e_month], params[:e_day])   
  end
end
