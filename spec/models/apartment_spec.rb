require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) {User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate street' do
    apartment = user.apartments.create(
      unit: '216',
      city: 'Scary Ville',
      state: 'AH',
      square_footage: 10000,
      price: "5000",
      bedrooms: 1,
      bathrooms: 5,
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it 'should validate unit' do
    apartment = user.apartments.create(
      street: 'John St.',
      city: 'Scary Ville',
      state: 'AH',
      square_footage: 10000,
      price: "5000",
      bedrooms: 1,
      bathrooms: 5,
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:unit]).to include("can't be blank")
  end

  it 'should validate city' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      state: 'AH',
      square_footage: 10000,
      price: "5000",
      bedrooms: 1,
      bathrooms: 5,
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:city]).to include("can't be blank")
  end

  it 'should validate state' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      city: 'Scary Ville',
      square_footage: 10000,
      price: "5000",
      bedrooms: 1,
      bathrooms: 5,
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:state]).to include("can't be blank")
  end

  it 'should validate square_footage' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      city: 'Scary Ville',
      state: 'AH',
      price: "5000",
      bedrooms: 1,
      bathrooms: 5,
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:square_footage]).to include("can't be blank")
  end

  it 'should validate price' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      city: 'Scary Ville',
      state: 'AH',
      square_footage: 10000,
      bedrooms: 1,
      bathrooms: 5,
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end

  it 'should validate bedrooms' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      city: 'Scary Ville',
      state: 'AH',
      square_footage: 10000,
      price: "5000",
      bathrooms: 5,
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end
  it 'should validate bathrooms' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      city: 'Scary Ville',
      state: 'AH',
      square_footage: 10000,
      price: "5000",
      pets: "not allowed",
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end
  it 'should validate pets' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      city: 'Scary Ville',
      state: 'AH',
      square_footage: 10000,
      price: "5000",
      bathrooms: 5,
      image: "https://images.unsplash.com/photo-1621620844943-3c7f2b9d3300?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80"
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end
  it 'should validate image' do
    apartment = user.apartments.create(
      street: 'John St.',
      unit: '216',
      city: 'Scary Ville',
      state: 'AH',
      square_footage: 10000,
      price: "5000",
      bathrooms: 5,
      pets: "not allowed",
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end
end
