# frozen_string_literal: true

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
