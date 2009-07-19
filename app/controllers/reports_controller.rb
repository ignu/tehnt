class ReportsController < ApplicationController 
  before_filter :get_start_date, :only =>  [:list]
  before_filter :get_end_date, :only => [:list]
  
  def index
    @reservations = Reservation.all 
  end
  
  def list
    @reservations = Reservation.for_date_requested(@start_date, @end_date) 
    render 'index'
  end 
end
