require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "#home" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :home
        expect(response).to be_success
      end

      it "returns a 200 response" do
        sign_in @user
        get :home
        expect(response).to have_http_status "200"
      end
    end

    context "as an guest" do
      it "returns a 302 response" do
        get :home
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get :home
        expect(response).to redirect_to "/user/sign_in"
      end
    end
  end
end
