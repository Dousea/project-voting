# frozen_string_literal: true

class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_candidate!

  def index
    @candidates = User.candidates.order('candidate_attributes.number ASC')

    redirect_to profile_path, alert: 'Tidak ada kandidat yang tersedia.' if @candidates.empty?
  end

  def show
    @candidate = User.candidates.find_by(candidate_attributes: { number: params[:number] })

    redirect_to profile_path, alert: "Tidak ada kandidat bernomor #{params[:number]}." if @candidate.nil?
  end

  private

  def redirect_if_candidate!
    redirect_to profile_path, alert: 'Anda tidak bisa mengakses karena Anda seorang kandidat!' if current_user.candidate?
  end
end
