require 'spec_helper'

describe CvsController do

  describe "GET 'cvs/show'" do
    it "returns http success" do
      @user = Fabricate.build(:user)
      @cv = Fabricate.build(:cv)
      User.stub(:find) { @user }
      Cv.stub(:find) { @cv }

      visit '/cv'
      response.should be_success
    end
  end

end
