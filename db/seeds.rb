# frozen_string_literal: true

if Rails.env.development?
  Admin.create!(email: 'admin@example.com', password: 'password',
                password_confirmation: 'password')
end
