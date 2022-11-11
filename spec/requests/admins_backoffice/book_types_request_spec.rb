# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::BookTypes', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/book_types'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    subject!(:book_type) { create :book_type }

    before { sign_in(create(:admin)) }

    it 'responds success' do
      get '/admins_backoffice/book_types'

      expect(response.status).to eq 200
    end

    it 'responds with a book type' do
      get '/admins_backoffice/book_types'

      expect(response.body).to include book_type.description
    end
  end
end
