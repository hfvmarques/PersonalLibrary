require 'rails_helper'

RSpec.describe Publisher, type: :model do
  subject(:publisher) { build(:publisher, description: description) }
  let(:description) { 'Editora X' }

  it { is_expected.to be_valid }

  it { should respond_to(:books) }

  context 'when the description is empty' do
    let(:description) { '' }

    it { is_expected.not_to be_valid }
  end

  context 'when the description is blank' do
    let(:description) { ' ' }

    it { is_expected.not_to be_valid }
  end

  context 'when the description is nil' do
    let(:description) { nil }

    it { is_expected.not_to be_valid }
  end
end
