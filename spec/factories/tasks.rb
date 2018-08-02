FactoryBot.define do
  factory :task do
    subject         { Faker::RickAndMorty.quote #=> "Ohh yea, you gotta get schwifty." }
    description     { Faker::Lorem.paragraph }
    priority        { "Medium" }
    due_date        Time.now + 10.days
  end
end
