require 'rails_helper'

RSpec.describe Subject, type: :model do
  subject(:subject) { build(:subject, description: description) }
  let(:description) { 'Assunto X' }

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
