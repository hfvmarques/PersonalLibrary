# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  subject(:loan) { build(:loan, book: book, description: description) }

  let(:book) { create(:book) }
  let(:description) { 'Pessoa X' }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:book) }

  it { expect(loan.loaned_at.strftime('%d/%m/%y %H:%M:%S')).to eq(Time.current.strftime('%d/%m/%y %H:%M:%S')) }
  it { expect(loan.returned_at).to be_nil }

  context 'when there is no book related' do
    let(:book) { nil }

    it { is_expected.not_to be_valid }
  end

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
