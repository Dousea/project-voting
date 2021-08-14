# frozen_string_literal: true

class CreateCandidateAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_attributes do |t|
      t.references :user, null: false, index: { unique: true }, foreign_key: true
      t.integer :number, null: false
      t.text :vision, null: false
      t.text :mission, null: false

      t.timestamps
    end
  end
end
