# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::Admins', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/admins'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    subject(:admin) { create :admin }

    before { sign_in(admin) }

    it 'responds success' do
      get '/admins_backoffice/admins'

      expect(response.status).to eq 200
    end

    it 'responds with an admin' do
      get '/admins_backoffice/admins'

      expect(response.body).to include admin.email
    end
  end
end
