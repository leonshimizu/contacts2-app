class ContactsController < ApplicationController
  def index
    contacts = Contact.all 
    render json: contacts
  end

  def create
    results = Geocoder.search(params[:address])
    geo_latitude = results.first.coordinates[0]
    geo_longitude = results.first.coordinates[1]

    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      latitude: geo_latitude,
      longitude: geo_longitude
    )
    contact.save
    render json: contact
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def update
    results = Geocoder.search(params[:address])
    geo_latitude = results.first.coordinates[0]
    geo_longitude = results.first.coordinates[1]

    contact = Contact.find_by(id: params[:id])
    contact.first_name = params[:first_name] || contact.first_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    contact.latitude = geo_latitude || contact.latitude
    contact.longitude = geo_longitude || contact.longitude
    contact.save
    render json: contact
  end

  def destroy 
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    message = "Successfully deleted contact."
    render json: message
  end
end
