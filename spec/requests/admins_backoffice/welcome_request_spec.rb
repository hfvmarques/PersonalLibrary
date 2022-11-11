# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::Welcome', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/welcome/index'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    before { sign_in(create(:admin)) }

    it 'responds success' do
      get '/admins_backoffice/welcome/index'

      expect(response.status).to eq 200
    end
  end
end
