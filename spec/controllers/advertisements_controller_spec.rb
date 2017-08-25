require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:the_ad) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [the_ad] to @advertisements" do
      get :index
      expect(assigns(:advertisement)).to eq([the_ad])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show {id:the_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id:the_ad.id}
      expect(response).to render_template :show
    end

    it "assigns the_ad to @advertisement" do
      get :show, {id:the_ad.id}
      expect(assigns(:advertisement)).to eq(the_ad)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "render the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST create" do

    it "increases the number of Advertisement by 1" do
      expect{advertisements :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisements to @advertisement" do
      advertisements :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      advertisements :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5}
      expect(response).to redirect_to Advertisement.last
    end
  end

end