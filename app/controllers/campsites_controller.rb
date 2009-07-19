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

  def update
    @campsite = Campsite.find self.params[:id]
    @campsite.update_attributes(self.params[:campsite])
    @campsite.save!
    redirect_to "/campgrounds/#{@campsite.campground.name}/campsites"
  end

  def create
    @campsite = Campsite.new(self.params[:campsite])
    @campsite.save!
    redirect_to "/campgrounds/#{@campsite.campground.name}/campsites"
  end

  def index
    @campsites = Campsite.all
  end

end