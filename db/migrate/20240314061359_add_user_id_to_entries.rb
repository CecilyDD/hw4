class AddUserIdToEntries < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:entries, :user_id)
      add_reference :entries, :user, foreign_key: true
    end
  end
end
