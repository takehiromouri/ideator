class RemoveAuthorFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :author
    add_column :ideas, :user_id, :integer
    add_index :ideas, :user_id
    add_foreign_key :ideas, :users
  end
end
