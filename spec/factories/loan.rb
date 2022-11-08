FactoryBot.define do
  factory :loan do
    book { create(:book) }
    description { 'Pessoa X' }
    loaned_at { Time.current }
  end
end