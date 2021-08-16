# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :candidate_attribute, dependent: :destroy
  has_one :vote, foreign_key: 'constituent_id', inverse_of: :constituent
  has_many :votes, foreign_key: 'candidate_id', inverse_of: :candidate

  scope :candidates, -> { joins(:candidate_attribute) }

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
    !candidate? && !voted?
  end
end
