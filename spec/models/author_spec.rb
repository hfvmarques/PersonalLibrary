require 'rails_helper'

RSpec.describe Author, type: :model do
  subject(:author) { build(:author, description: description) }
  let(:description) { 'Autor X' }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to(:books) }

  context 'when it is an empty description' do
    let(:description) { '' }

    it { is_expected.not_to be_valid }
  end

  context 'when it is an blank description' do
    let(:description) { ' ' }

    it { is_expected.not_to be_valid }
  end

  context 'when it is an null description' do
    let(:description) { nil }

    it { is_expected.not_to be_valid }
  end
end
