# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::Publishers', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/publishers'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    subject!(:publisher) { create :publisher }

    before { sign_in(create(:admin)) }

    it 'responds success' do
      get '/admins_backoffice/publishers'

      expect(response.status).to eq 200
    end

    it 'responds with a publisher' do
      get '/admins_backoffice/publishers'

      expect(response.body).to include publisher.description
    end
  end
end
