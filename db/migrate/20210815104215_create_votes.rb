# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :candidate, null: false, foreign_key: { to_table: :users }
      t.references :constituent, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :votes, %i[candidate_id constituent_id], unique: true
    add_reference :users, :vote
  end
end
