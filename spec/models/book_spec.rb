# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) do
    build(
      :book,
      title: title,
      publisher: publisher,
      published_at: published_at,
      edition: edition,
      book_type: book_type,
      active_loan: active_loan,
      authors: authors,
      subjects: subjects
    )
  end

  let(:title) { 'Livro X' }
  let(:publisher) { build(:publisher) }
  let(:published_at) { 2020 }
  let(:edition) { 1 }
  let(:book_type) { build(:book_type) }
  let(:active_loan) { false }
  let(:authors) { [build(:author)] }
  let(:subjects) { [build(:subject)] }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to(:authors) }
  it { is_expected.to respond_to(:subjects) }
  it { is_expected.to respond_to(:loans) }

  it { expect(book.active_loan).to be_falsey }

  context 'when active_loan is true' do
    let(:active_loan) { true }

    it { is_expected.to be_valid }
  end

  context 'when title is empty' do
    let(:title) { '' }

    it { is_expected.not_to be_valid }
  end

  context 'when title is blank' do
    let(:title) { ' ' }

    it { is_expected.not_to be_valid }
  end

  context 'when title is nil' do
    let(:title) { nil }

    it { is_expected.not_to be_valid }
  end

  context 'when edition is empty' do
    let(:edition) { '' }

    it { is_expected.not_to be_valid }
  end

  context 'when edition is blank' do
    let(:edition) { ' ' }

    it { is_expected.not_to be_valid }
  end

  context 'when edition is nil' do
    let(:edition) { nil }

    it { is_expected.not_to be_valid }
  end

  context 'when publisher is nil' do
    let(:publisher) { nil }

    it { is_expected.not_to be_valid }
  end

  context 'when published_at is empty' do
    let(:published_at) { '' }

    it { is_expected.not_to be_valid }
  end

  context 'when published_at is blank' do
    let(:published_at) { ' ' }

    it { is_expected.not_to be_valid }
  end

  context 'when published_at is nil' do
    let(:published_at) { nil }

    it { is_expected.not_to be_valid }
  end

  context 'when book_type is nil' do
    let(:book_type) { nil }

    it { is_expected.not_to be_valid }
  end

  context 'when there is no author' do
    let(:authors) { [] }

    it { is_expected.not_to be_valid }
  end

  context 'when there is no subject' do
    let(:subjects) { [] }

    it { is_expected.not_to be_valid }
  end
end
