class ContactsController < ApplicationController
  def index
    contacts = Contact.all 
    render json: contacts
  end

  def create
    # address = params[:address]

    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      latitude: params[:latitude],
      longitude: params[:longitude]
    )
    contact.save
    render json: contact
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def update
    contact = Contact.find_by(id: params[:id])
    contact.first_name = params[:first_name] || contact.first_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    contact.latitude = params[:latitude] || contact.latitude
    contact.longitude = params[:longitude] || contact.longitude
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
