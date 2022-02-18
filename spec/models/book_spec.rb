require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { described_class.new(
    title: "Livro X",
    publisher: Publisher.new,
    published_at: 2020,
    edition: 1,
    book_type: BookType.new,
    active_loan: false) 
  }

  it { expect(subject).to be_valid }
  it { should respond_to(:authors) }
  it { should respond_to(:subjects) }

  it 'is not valid without a publisher' do
    subject.publisher = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a book type' do
    subject.book_type = nil
    expect(subject).not_to be_valid
  end

  it { should respond_to(:loans) }
end
