class ReportsController < ApplicationController 
  before_filter :get_start_date, :only =>  [:list]
  before_filter :get_end_date, :only => [:list]
  
  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.html 
      format.csv { render :template => 'reports/csv', :layout => false} 
    end
  end
  
  def list
    @reservations = Reservation.for_date_requested(@start_date, @end_date) 
    respond_to do |format|
      format.html {render 'index'} 
      format.csv { render :template => 'reports/csv', :layout => false} 
    end
  end 
end
