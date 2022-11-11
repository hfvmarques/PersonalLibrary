# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::Authors', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/authors'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    subject!(:author) { create :author }

    before { sign_in(create(:admin)) }

    it 'responds success' do
      get '/admins_backoffice/authors'

      expect(response.status).to eq 200
    end

    it 'responds with an author' do
      get '/admins_backoffice/authors'

      expect(response.body).to include author.description
    end
  end
end
