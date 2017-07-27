require 'rails_helper'

RSpec.describe "Consultants API", :type => :request do
  let!(:consultant) { FactoryGirl.create(:consultant) }

  context "with valid params" do 
    it "responds with success" do
      get '/v1/consultants', params: {locality: 'Boston', products: "[1,2]", experiences: "CMC"}
      expect(response).to be_success
    end

    it "finds correct consultant" do
      get '/v1/consultants', params: {locality: 'Boston', products: "[1,2]", experiences: "CMC"}
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    it "does not return consultant that does not match param" do
      get '/v1/consultants', params: {locality: 'New York', products: "[1,2]", experiences: "CMC"}
      json = JSON.parse(response.body)
      expect(json.length).to eq(0)
    end
  end

  context "with missing param" do
    it "responds with unprocessable entity" do
      get '/v1/consultants', params: {}
      expect(response).to be_unprocessable
    end
  end
end