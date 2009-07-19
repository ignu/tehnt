require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CampsitesController do
  describe "new" do

    before(:each) do
      campsite = mock_model(Campsite)
      Campsite.should_receive(:new).and_return(campsite)
      campgrounds = mock_model(Array)
      Campground.should_receive(:all).and_return(campgrounds)
      get :new
    end

    it { should assign_to(:campsite)     }
    it { should assign_to(:campgrounds)  }
    it { should render_template(:edit)   }
    it { should respond_with(:success)   }
  end

  describe "save, with valid data"    do
    before(:each) do
      @params = {:name => 'a site', :beds=> 4, :price => 34.23}
      @campsite = mock_model(Campsite)
      Campsite.should_receive(:new).with(hash_including(@params)).and_return(@campsite)
      @campsite.should_receive(:save!).and_return(@campsite)
      post(:save, {:campsite => @params})
    end

    it { should assign_to(:campsite) }
    it { should respond_with(:redirect) }
  end

  describe "list" do

    before(:each) do

      @campground = mock_model(Campground)
      #todo: figure out why this fails, think the with block doesn't match
      Campground.should_receive(:find_by_name).with("wut", :include=>'campsites').and_return(@campground)

      get "/campgrounds/wut/campsites/"
    end

    it { should assign_to(:campground)}
    it { should respond_with(:success)}
  end


  describe "routing" do
   it "connects /campsites/new to new" do
     params_from(:get, "/campsites/new").should == {:controller => 'campsites', :action => 'new'}
   end

   it "connects /campsites/save to save" do
     params_from(:post, "/campsites/save").should == {:controller => 'campsites', :action => 'save'}
   end

   it "connects /campgrounds/:campground_name/campsites/ to list" do
     puts params_from(:get, "/campgrounds/boo/campsites/").should ==
             {:controller => 'campsites', :action => 'index', :campground_name => 'boo'}

    end
  end
end



