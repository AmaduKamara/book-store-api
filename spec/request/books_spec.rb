require 'rails_helper'

describe 'Books API', type: :request do

  describe 'Get /books' do
    before do
      FactoryBot.create(:book, title: 'The mandalorian', author: "Tom Kadwil")
      FactoryBot.create(:book, title: 'The Rails bot', author: "Tom Kadwil")
    end
    
    it 'returns all books' do

      get '/api/v1/books'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /books' do
    it 'create a new book' do
      expect {
        post '/api/v1/books', params: {book: { title: 'The Marshals', author: 'Tom Kadwil'}}
      }.to change { Book.count }.from(0).to(01)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DESTROY /books/:id' do
    let!(:book) { FactoryBot.create(:book, title: 'The mandalorian', author: "Tom Kadwil") }
    
    it 'deletes a book' do
      expect {
        delete "/api/v1/books/#{book.id}"
      }.to change { Book.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end