FactoryBot.define do
  factory :book do
    title { 'Livro X' }
    publisher { create(:publisher) }
    published_at { 2020 }
    edition { 1 }
    book_type { create(:book_type) }
    authors { [create(:author)] }
    subjects { [create(:subject)] }
  end
end