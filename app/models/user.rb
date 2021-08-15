# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable,
         :recoverable, :rememberable, :validatable

  has_one :candidate_attribute, dependent: :destroy

  scope :candidates, -> { joins(:candidate_attribute) }

  validates :name, presence: true
  validates :sidn, presence: true, uniqueness: true

  delegate :number, :vision, :mission, to: :candidate_attribute, allow_nil: true

  def candidate?
    !candidate_attribute.nil?
  end

  def can_vote?
    !candidate?
  end
end
