require 'rails_helper'

RSpec.describe BookType, type: :model do
  subject { described_class.new(description: "Tipo X") }

  it { expect(subject).to be_valid }

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it { should respond_to(:books) }
end
