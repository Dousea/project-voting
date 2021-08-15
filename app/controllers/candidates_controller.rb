# frozen_string_literal: true

class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_candidate!

  def index
    @candidates = User.candidates.order('candidate_attributes.number ASC')

    respond_to do |format|
      format.html do
        redirect_to profile_path, alert: 'Tidak ada kandidat yang tersedia.' if @candidates.empty?
      end
    end
  end

  def show
    @candidate = User.candidates.find_by(candidate_attributes: { number: params[:number] })

    respond_to do |format|
      format.html do
        redirect_to profile_path, alert: "Tidak ada kandidat bernomor #{params[:number]}." if @candidate.nil?
      end
    end
  end

  def vote
    respond_to do |format|
      format.html do
        @candidate = User.candidates.find_by(candidate_attributes: { number: params[:number] })
    
        unless @candidate.nil?
          if current_user.update(voted_candidate: @candidate)
            render :thank_you
          else
            logger.error "[ERROR] Couldn't vote. #{current_user.errors.full_messages.join(', ')}."
            redirect_to vote_path, alert: 'Tidak bisa memilih. Cobalah beberapa saat lagi.'
          end
        end
      end
    end
  end

  private

  def redirect_if_candidate!
    return unless current_user.candidate?

    respond_to do |format|
      format.html do
        redirect_to profile_path, alert: 'Anda tidak bisa mengakses karena Anda seorang kandidat!'
      end
    end
  end
end
