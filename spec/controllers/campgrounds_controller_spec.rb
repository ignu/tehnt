require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CampgroundsController do

  #Delete these examples and add some real ones
  it "should use CampgroundsController" do
    controller.should be_an_instance_of(CampgroundsController)
  end

  describe "list" do
    before(:each) do
      campgrounds = mock_model(Array)
      Campground.should_receive(:all).and_return(campgrounds)
      get 'list'
    end
    it { should assign_to(:campgrounds)     }
    it { should render_template('list')     }
    it { should respond_with(:success)      }
  end

 end


describe CampgroundsController, "routing" do

  it "connects the root of the site to new" do
    params_from(:get, "/").should == {:controller => 'campgrounds', :action => 'list'}
  end

    it "GET 'list' be successful" do
      get 'list'
      response.should be_success
    end
  
end
