FactoryGirl.define do
  factory :website_listing do
    name { Faker::Company.name }
    url { Faker::App.name + ".com" }
    note { Faker::Hacker.say_something_smart }
  end
end
