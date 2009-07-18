require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :first_name => 'len' ,
      :last_name => 'smith',
      :login => 'ignu',
      :email => 'ignu.smith@gmail.com'    
    }
  end

  it "should create a new instance given valid attributes" do
    #TODO: User.create!(@valid_attributes)
  end
end
