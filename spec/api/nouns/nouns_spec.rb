require 'rails_helper'

RSpec.describe "Nouns endpoint" do
  describe "create nouns" do
    it "can create a new noun in DB from given query param" do

      post "/nouns?noun=island"
      data = JSON.parse(response.body, symbolize_names:true)

      expect(data).to have_key(:data)
      expect(data[:data]).to have_key(:id)
      expect(data[:data]).to have_key(:type)
      expect(data[:data]).to have_key(:attributes)
      expect(data[:data][:attributes]).to have_key(:noun)
      expect(data[:data][:attributes][:noun]).to eq("island")
      expect(Noun.last.noun).to eq("island")
    end

    it "requires a query params is submitted before creating new noun" do
      
      post "/nouns"

      expect(JSON.parse(response.body)).to eq(["Noun can't be blank"])
    end
  end
end