# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable,
         :recoverable, :rememberable, :validatable

  has_one :candidate_attribute, dependent: :destroy

  validates :name, presence: true
  validates :sidn, presence: true
end
