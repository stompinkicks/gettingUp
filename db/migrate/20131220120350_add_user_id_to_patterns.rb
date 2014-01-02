class AddUserIdToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :user_id, :integer
    add_index :patterns, :user_id
  end
end
