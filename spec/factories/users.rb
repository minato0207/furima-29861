FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    birthday              {Faker::Date.backward}
    first_name            {person.first.kanji}
    last_name             {person.last.kanji}
    first_name_kana       {person.first.katakana}
    last_name_kana        {person.last.katakana}
  end
end


