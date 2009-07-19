class CampsitesController < ApplicationController
  def new 
    @campsite = Campsite.new
    @campgrounds = Campground.all
    render "edit"
  end

  def edit
    @campsite = Campsite.find self.params[:id]
    @campgrounds = Campground.all
  end

    def save
    @campsite = Campsite.new(self.params[:campsite])
    @campsite.save!
    redirect_to "/campgrounds/#{@campsite.name}/campsites"
    end

  def save
    @campsite = Campsite.new(self.params[:campsite])    
    @campsite.save!
    redirect_to "/campgrounds/#{@campsite.name}/campsites"
  end

  def index
    @campground = Campground.find_by_name(self.params[:campground_name],
      :include => 'campsites')
    render "list"
  end

end