# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::Loans', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/loans'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    subject!(:loan) { create :loan }

    before { sign_in(create(:admin)) }

    it 'responds success' do
      get '/admins_backoffice/loans'

      expect(response.status).to eq 200
    end

    it 'responds with a loan' do
      get '/admins_backoffice/loans'

      expect(response.body).to include loan.description
    end
  end
end
