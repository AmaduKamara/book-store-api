class BooksController < ApplicationController
  def index
    # render JSON data
    render json: Book.all
  end

  def create
    # add logic for creating a book
    book = Book.new(title: "The Web Avenger", author: "Amkam")

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end
end
