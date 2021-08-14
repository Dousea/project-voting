# frozen_string_literal: true

class AddSidnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sidn, :string
  end
end
