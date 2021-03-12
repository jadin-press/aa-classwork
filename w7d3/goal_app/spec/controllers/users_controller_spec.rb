require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders new user template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    let(:valid_params) { { user: { username: "Johnson", password: "Johnson&Johnson" } } }
    let(:invalid_params) { { user: { username: "Johnson", password: "" } } }
    let(:user) { User.find_by(username: "Johnson" ) }

    context "with valid params" do
      before :each do
        post :create, params: valid_params
      end

      it "creates the user" do
        expect(User.last.username).to eq("Johnson")
      end

      it "logs in user" do
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects to users show page" do
        expect(response).to redirect_to(user_url(user))
      end

    end

    context "with invalid params" do
      before :each do
        post :create, params: invalid_params
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end

      it "adds errors to flash" do
        expect(flash[:errors]).to be_present
      end
    end
    
  end
end
