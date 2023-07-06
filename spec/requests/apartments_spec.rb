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

  describe "POST /create" do
    it "creates a apartment" do
      # The params we are going to send with the request
      user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

      apartment_params = {
      apartment: {
          street: 'ABC Sesame Street',
          unit: '20',
          city: 'Sesame',
          state: 'MUPPET',
          square_footage: 3000,
          price: "1900",
          bedrooms: 5,
          bathrooms: 3,
          pets: "puppets only",
          user_id: user1.id,
          image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
      }
      }

  
      # Send the request to the server
      post '/apartments', params: apartment_params
  
      # Assure that we get a success back
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      apartment = Apartment.all

      # Assure that the created cat has the correct attributes
      expect(apartment.length).to eq 1
    end
  end
  describe "PATCH /update" do
    it "updates an apartment" do
      user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

      apartment_params = {
          apartment: {
          street: 'ABC Sesame Street',
          unit: '20',
          city: 'Sesame',
          state: 'MUPPET',
          square_footage: 3000,
          price: "1900",
          bedrooms: 5,
          bathrooms: 3,
          pets: "puppets only",
          user_id: user1.id,
          image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
        }
      }

      post '/apartments', params: apartment_params
      apartment = Apartment.first

      updated_apartment_params = {
        apartment: {
          street: 'ABC Sesame Street',
          unit: '20',
          city: 'Sesame',
          state: 'MUPPET',
          square_footage: 3000,
          price: "3000",
          bedrooms: 5,
          bathrooms: 3,
          pets: "puppets only",
          user_id: user1.id,
          image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
        }
      }

      patch "/apartments/#{apartment.id}", params: updated_apartment_params

      updated_apartment = Apartment.find(apartment.id)

      expect(response).to have_http_status(200)
      expect(updated_apartment.price).to eq "3000"
    end
  end
end