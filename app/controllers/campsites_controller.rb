class CampsitesController < ApplicationController
  def new 
    @campsite = Campsite.new
    render "edit"    
  end

  def save

    
    render 'edit'
  end

  def list
  end

end
