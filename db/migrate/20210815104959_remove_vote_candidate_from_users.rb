# frozen_string_literal: true

class RemoveVoteCandidateFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :voted_candidate, foreign_key: { to_table: :users }
  end
end
