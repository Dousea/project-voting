# frozen_string_literal: true

class AddSidnUniqueIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :sidn, unique: true
  end
end
