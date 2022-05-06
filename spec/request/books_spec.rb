require 'rails_helper'

describe 'Books API', type: :request do
  describe 'Get /books' do
    it 'returns all books' do
      FactoryBot.create(:book, title: 'The mandalorian', author: "Tom Kadwil")
      FactoryBot.create(:book, title: 'The Rails bot', author: "Tom Kadwil")

      get '/api/v1/books'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /books' do
    it 'create a new book' do
      post '/api/v1/books', params: {book: { title: 'The Marshals', author: 'Tom Kadwil'}}

      expect(response).to have_http_status(:created)
    end
  end
end