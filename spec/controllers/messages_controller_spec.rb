require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  before do
    sign_in user
  end

  after do
    sign_out user
  end

  describe "GET #index" do
    before do
      get :index, group_id: group.id
    end

    it "assigns the requested to @message" do
      get :index, params: { group_id: group.id }
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested to @group" do
      get :index, params: { group_id: group.id }
      expect(assigns(:group)).to eq group
    end

    it "render the index template " do
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    let(:message) { build(:message) }
    let(:params_invalid) { build(:message, body: nil) }

    it "saves the new message in the database" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "cannot save a new message in the database without any body" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:params_invalid)
      }.not_to change(Message, :count)
    end

    it "redirects to message#index" do
      post :create, group_id: group.id, message: attributes_for(:message)
      expect(response).to redirect_to group_messages_path(group)
    end
  end
end

