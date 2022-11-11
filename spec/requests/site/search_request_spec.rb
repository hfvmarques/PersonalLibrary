# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Site::Searches', type: :request do
  before { create :book }

  it 'responds success with a search term' do
    get '/site/search?term=whatever'

    expect(response.status).to eq 200
  end

  it 'responds without the book according to the search' do
    get '/site/search?term=whatever'

    expect(response.body).not_to include 'Livro X'
  end

  it 'responds with a book according to the search' do
    get '/site/search?term=assunto'

    expect(response.body).to include 'Livro X'
  end
end
