# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable,
         :recoverable, :rememberable, :validatable
end
