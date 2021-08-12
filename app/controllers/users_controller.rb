# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user
  end

  private

  def user
    @user ||= current_user
  end
end
