FactoryBot.define do
  factory :task do
    subject         { Faker::RickAndMorty.quote } #=> "Ohh yea, you gotta get schwifty."
    description     { Faker::Lorem.paragraph }
    priority        "Medium"
    due_date        DateTime.now
    association     :user
  end
end
