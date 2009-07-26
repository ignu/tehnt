class ReservationsController < ApplicationController    
  before_filter :find_campground, :only => [:index]
  before_filter :get_start_date, :only =>  [:index]
  before_filter :get_end_date, :only => [:index]
  
  def index
    @campsites = @campground.campsites
    @reservations = Reservation.for_date_requested(@start_date, @end_date)
    if admin? 
      render "index_admin"
    end
  end 
  
  def show
  end
  
  def new
    @campsites = []
    selected_campsites = params[:selected_campsites].split(",")

      selected_campsites.each do |site|
        @campsites << Campsite.find(site.to_i)
        
      end

    if @campsites
      @reservation_start_date = params[:dates][:reservation_start_date].to_date
      @reservation_end_date = params[:dates][:reservation_end_date].to_date
      logger.info "Selected campsites array #{params[:selected_campsites]}"
      logger.info @campsites.inspect
    else
      flash[:error] = "You have not selected any campsites."
    end
  end 
  
  def create
    @reservation = Reservation.create(params[:reservation])
    for campsite in params[:selected_campsites].keys
       @reservation.campsites << Campsite.find_by_name(campsite)
    end
    @reservation.registrants << Registrant.create(params[:reg1])
    @reservation.registrants << Registrant.create(params[:reg2])
    @reservation.in_council = false unless @reservation.council_name == 'Great Sauk Trail' 
    @reservation.start_date = params[:start_date][:start_date]
    @reservation.end_date = params[:end_date][:end_date]
    if @reservation.save
      flash[:success] = "Saved"
    else
      logger.info "Failed to save: #{@reservation.errors.to_json}"
      flash[:error] = list_errors(@reservation.errors)
    end
  end
  
  def set_paid
    @reservation = Reservation.find(params[:id])
    @reservation.paid_in_full = params[:value]
    @reservation.save!
    if @reservation.paid_in_full #sry
      render :text => "Reservation ##{@reservation.id} marked paid in full"
    else
      render :text => "Reservation ##{@reservation.id} marked as unpaid!"
    end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation == nil
      flash[:notice] = "Reservation not found"
    else
      Reservation.destroy(params[:id])
      flash[:notice] = "Reservation ##{params[:id]} deleted"
    end
    redirect_to :back
  end
  
  protected
  
  def find_campground
    @campground = Campground.find(params[:campground_id])
  end

end
