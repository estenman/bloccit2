require 'rails_helper'

RSpec.describe SponsoredPostsController do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsor) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10) }

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsor.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsor.id
      expect(response).to render_template :show
    end

    it "assigns my_sponsor to @sponsor" do
      get :show, topic_id: my_topic.id, id: my_sponsor.id
      expect(assigns(:sponsored_post)).to eq(my_sponsor)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @sponsor" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsor.id
      expect(response).to render_template :edit
    end

    it "assigns post to be updated to @post" do
      get :edit, topic_id: my_topic.id, id: my_sponsor.id
      sponsor_instance = assigns(:sponsored_post)

      expect(sponsor_instance.id).to eq my_sponsor.id
      expect(sponsor_instance.title).to eq my_sponsor.title
      expect(sponsor_instance.body).to eq my_sponsor.body
      expect(sponsor_instance.price).to eq my_sponsor.price
    end
  end

end
