class CampgroundsController < ApplicationController

  def list
    @campgrounds = Campground.all
    self.render("list")
  end

end
