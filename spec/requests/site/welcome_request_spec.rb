# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Site::Welcome', type: :request do
  it 'responds success to root page' do
    get '/'

    expect(response.status).to eq 200
  end
end
