require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CampsitesController do
  describe "new" do
  
    before(:each) do
      campsite = mock_model(Campsite)
      Campsite.should_receive(:new).and_return(campsite)
      get :new
    end

    it { should assign_to(:campsite)        }
    it { should render_template(:edit)   }
    it { should respond_with(:success)  }
  end

  describe "save, with valid data"  do

    before(:each) do
      @params = {:name => 'a site', :beds=> 4, :price => 34.23}
      @campsite = mock_model(Campsite)
      Campsite.should_receive(:new).with(hash_including(@params)).and_return(@campsite)
      @campsite.should_receive(:save!).and_return(@campsite)
      post(:save, {:campsite => @params})
    end

    it { should assign_to(:campsite) }
    it { should respond_with(:success) }

  end

  describe "routing" do
   it "connect /campsites/new to new" do
     params_from(:get, "/campsites/new").should == {:controller => 'campsites', :action => 'new'}
    end
  end
end

