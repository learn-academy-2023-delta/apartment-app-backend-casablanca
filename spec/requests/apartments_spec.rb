require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  describe "GET /index" do
    it "gets a list of apartments" do
      user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

      user1.apartments.create(
          street: 'ABC Sesame Street',
          unit: '20',
          city: 'Sesame',
          state: 'MUPPET',
          square_footage: 3000,
          price: "1900",
          bedrooms: 5,
          bathrooms: 3,
          pets: "puppets only",
          image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
      )

      #Make a request
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.length).to eq 1


    end
  end
end
