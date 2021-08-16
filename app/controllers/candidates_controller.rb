# frozen_string_literal: true

class CandidatesController < ApplicationController
  before_action :authenticate_user!, except: :live
  before_action :redirect_if_cannot_vote!, except: :live

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

        if @candidate.nil?
          redirect_to vote_path, alert: 'Tidak bisa memilih seorang yang bukan kandidat.'
        else
          vote = Vote.create(constituent: current_user, candidate: @candidate)

          if vote.persisted?
            render :thank_you
          else
            logger.error "[ERROR] Couldn't vote: #{vote.errors.full_messages.join(', ')}."
            redirect_to vote_path, alert: 'Tidak bisa memilih. Cobalah beberapa saat lagi.'
          end
        end
      end
    end
  end

  def live; end

  private

  def redirect_if_cannot_vote!
    return if current_user.can_vote?

    respond_to do |format|
      format.html do
        redirect_to profile_path, alert: 'Tidak bisa mengakses karena tidak bisa memilih!'
      end
    end
  end
end
