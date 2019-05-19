require 'rails_helper'

RSpec.describe "Users Api", type: :request do
  describe "#index" do
    context "as an authenticated user" do
      let(:user) { create(:user) }
      before { sign_in user }
      it "responds successfully" do
        get users_path
        expect(response).to be_success
      end
      it "returns a 200 response" do
        get users_path
        expect(response).to have_http_status(200)
      end
    end
    context "as a guest" do
      it "returns a 302 response" do
        get users_path
        expect(response).to have_http_status(302)
      end
      it "redirect to the sign-in page" do
        get users_path
        expect(response).to redirect_to  "/user/sign_in"
      end
    end
  end

  describe "#show" do
    let(:user) { create(:user) }
    context "as an authenticated user" do
      before { sign_in user }

      it "responds successfully" do
        get user_path(user)
        expect(response).to be_success
      end
    end

    context "as an unauthorized user" do
      it "returns a 302 response" do
        get user_path(user)
        expect(response).to have_http_status(302)
      end
      it "redirect to the sign-in page" do
        get user_path(user)
        expect(response).to redirect_to "/user/sign_in"
      end
    end
  end

  describe "#home" do
    context "as an authenticated user" do
      let(:user) { create(:user) }
      before { sign_in user }
      context "with valid attributes" do
        it 'adds a post' do
          post_params = attributes_for(:post)
          expect {
            post posts_path, params: { post: post_params }
          }.to change(user.posts, :count).by(1)
          expect(response).to redirect_to root_path
        end
      end
      context "with invalid attributes" do
        it "does not add a post" do
          post_params = attributes_for(:post, :no_content)
          expect {
            post posts_path, params: { post: post_params }
          }.to_not change(user.posts, :count)
        end
      end
    end
  end
end
