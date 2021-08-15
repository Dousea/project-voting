# frozen_string_literal: true

if Rails.env.development?
  Admin.create!(email: 'admin@example.com', password: 'password',
                password_confirmation: 'password')

  (1..25).each do |index|
    User.create!(
      name: "Mahasiswa ##{index}",
      sidn: index.to_s.rjust(10, '0'),
      email: "u#{index}@unkris.ac.id",
      password: '12345678',
      password_confirmation: '12345678'
    )
  end

  (1..2).each do |index|
    user = User.create!(
      name: "Kandidat ##{index}",
      sidn: (index + 100).to_s.rjust(10, '0'),
      email: "c#{index}@unkris.ac.id",
      password: '12345678',
      password_confirmation: '12345678'
    )

    user.create_candidate_attribute!(
      number: index,
      vision: "Ut eget ullamcorper sapien. In blandit, mi ac placerat tincidunt, neque nisi lobortis mi, vitae elementum quam mauris id lorem. Proin egestas placerat risus, vel aliquam enim vehicula sit amet. Curabitur id neque nunc. Fusce aliquet in neque id consectetur. Vestibulum non vehicula metus. Praesent fringilla interdum sollicitudin. Phasellus accumsan ligula est, auctor pellentesque est porttitor quis. Nunc eget laoreet mi. Integer quis tortor ac sapien venenatis vestibulum eu nec nibh. Nullam tincidunt pulvinar urna id pretium. Praesent non ante in lorem sodales lobortis. Praesent sit amet ipsum sed augue eleifend sagittis sit amet tristique erat. Aenean mattis imperdiet quam, bibendum mollis nunc euismod sed.",
      mission: "Nam laoreet velit vel ex lacinia pellentesque. Sed turpis neque, commodo ac pulvinar quis, vestibulum ac neque. Nulla felis nisi, pretium vitae quam a, ullamcorper auctor odio. Aenean varius posuere lectus, ac porta dui iaculis a. Suspendisse non mi id lectus vestibulum fermentum. Aliquam convallis nisl arcu, id porta tortor venenatis at. Morbi vitae felis sed ante dictum finibus."
    )
  end
end
