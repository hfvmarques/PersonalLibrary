# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminsBackoffice::Subjects', type: :request do
  it 'responds failure without authentication' do
    get '/admins_backoffice/subjects'

    expect(response.status).to eq 302
  end

  context 'when it is authenticated' do
    subject!(:book_subject) { create :subject }

    before { sign_in(create(:admin)) }

    it 'responds success' do
      get '/admins_backoffice/subjects'

      expect(response.status).to eq 200
    end

    it 'responds with a subject' do
      get '/admins_backoffice/subjects'

      expect(response.body).to include book_subject.description
    end
  end
end
