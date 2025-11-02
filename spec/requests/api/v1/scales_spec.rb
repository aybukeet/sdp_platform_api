require 'rails_helper'

RSpec.describe "Scales API", type: :request do
  describe "POST /api/v1/scales" do
    it "yeni bir ölçek oluşturur" do
      user = User.create!(email: "test@example.com", password: "password123", name: "Test User")

      post "/api/v1/scales", params: { 
        scale: { 
          title: "Test Ölçeği", 
          description: "Bu bir testtir", 
          user_id: user.id,
          version: "1.0",         # Zorunlu
          language: "tr",         # Zorunlu, 'en' veya 'tr'
          status: "draft"         # Zorunlu, enum değeri
        } 
      }

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["data"]["title"]).to eq("Test Ölçeği")
      expect(json["data"]["unique_identifier"]).to match(/^SDP-\d{4}-\d{4}$/)
      expect(json["data"]["status"]).to eq("draft")
      expect(json["data"]["language"]).to eq("tr")
    end
  end
end
