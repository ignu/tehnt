require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CampgroundsController do

  #Delete these examples and add some real ones
  it "should use CampgroundsController" do
    controller.should be_an_instance_of(CampgroundsController)
  end



  describe CampgroundsController

  describe "GET 'list'" do
    it "should be successful" do
      get 'list'
      response.should be_success
    end

    it "GET '/' should be the list action" do
      get '/'
      response.should be_success
    end
  end
end
