class ContactsController < ApplicationController
  def index
    contacts = Contact.all 
    render json: contacts
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      address: params[:address]
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
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.email = params[:email]
    contact.phone_number = params[:phone_number]
    contact.address = params[:address]
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
