# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::Books', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/books'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    subject!(:book) { create :book }

    before { sign_in(create(:admin)) }

    it 'responds success' do
      get '/admins_backoffice/books'

      expect(response.status).to eq 200
    end

    it 'responds with a book' do
      get '/admins_backoffice/books'

      expect(response.body).to include book.title
    end
  end
end
