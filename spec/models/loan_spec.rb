require 'rails_helper'

RSpec.describe Loan, type: :model do
    subject { described_class.new(
    book: Book.new,
    description: 'Pessoa X',
    loaned_at: DateTime.now) 
  }

  it { expect(subject).to be_valid }

  it 'is not valid without a book' do
    subject.book = nil
    expect(subject).not_to be_valid
  end
end
