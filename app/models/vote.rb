# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :constituent, class_name: 'User', inverse_of: :vote
  has_one :candidate, class_name: 'User', dependent: :nullify, required: true, inverse_of: :vote
end
