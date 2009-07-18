class CampsitesController < ApplicationController
  def new 
    @campsite = Campsite.new
    render "edit"    
  end

  def save
    @campsite = Campsite.new(self.params[:campsite])
    @campsite.save!
    render 'edit'
  end

  def list
  end

end
