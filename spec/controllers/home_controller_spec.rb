require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      User.stub(:find) { Fabricate.build(:user) }
      Cv.stub(:find) { Fabricate.build(:cv) }

      get 'index'
      response.should be_success
    end
  end

end
