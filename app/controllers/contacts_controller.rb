class ContactsController < ApplicationController
  def index
    render json: {message: 1}
  end

  def create
    render json: {message: 2}
  end

  def show
    render json: {message: 3}
  end

  def update
    render json: {message: 4}
  end

  def destroy 
    render json: {message: 5}
  end
end
