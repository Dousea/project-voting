# frozen_string_literal: true

require 'securerandom'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable,
         :recoverable, :rememberable, :validatable

  has_one :candidate_attribute, dependent: :destroy
  has_one :vote, foreign_key: 'constituent_id', inverse_of: :constituent, dependent: :nullify
  has_many :votes, foreign_key: 'candidate_id', inverse_of: :candidate, dependent: :nullify

  scope :candidates, -> { joins(:candidate_attribute) }

  before_validation :set_default_password, if: -> { password.nil? && password_confirmation.nil? }
  validates :name, presence: true
  validates :sidn, presence: true, uniqueness: true

  delegate :number, :vision, :mission, to: :candidate_attribute, allow_nil: true

  def candidate?
    !candidate_attribute.nil?
  end

  def voted?
    !vote.nil?
  end

  def can_vote?
    !voted? && eligible?
  end

  private

  def set_default_password
    password = SecureRandom.hex
    self.password = password
    self.password_confirmation = password
  end
end
