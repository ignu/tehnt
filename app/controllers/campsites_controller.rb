class CampsitesController < ApplicationController
  def new 
    @campsite = Campsite.new
    render "edit"    
  end

  def save
    @campsite = Campsite.new(self.params[:campsite])
    @campsite.save!
    redirect_to '/campsites/new'        
  end

  def list
  end

end
