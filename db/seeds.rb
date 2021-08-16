# frozen_string_literal: true

if Rails.env.development?
  Admin.create!(email: 'admin@example.com', password: 'password',
                password_confirmation: 'password')

  25.times do
    name = Faker::Name.name

    User.create!(
      name: name,
      sidn: Faker::Number.number(digits: 10),
      email: Faker::Internet.free_email(name: name),
      password: '12345678',
      password_confirmation: '12345678'
    )
  end

  (1..2).each do |index|
    name = Faker::Name.name

    user = User.create!(
      name: name,
      sidn: Faker::Number.number(digits: 10),
      email: Faker::Internet.free_email(name: name),
      password: '12345678',
      password_confirmation: '12345678'
    )

    user.create_candidate_attribute!(
      number: index,
      vision: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 5),
      mission: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 5)
    )
  end
end
