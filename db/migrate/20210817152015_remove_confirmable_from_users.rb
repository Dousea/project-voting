class RemoveConfirmableFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
