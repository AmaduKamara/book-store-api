class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def create
    # add logic here
  end
end
