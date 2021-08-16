# frozen_string_literal: true

class AddVotedCandidateIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :voted_candidate, foreign_key: { to_table: :users }
  end
end
