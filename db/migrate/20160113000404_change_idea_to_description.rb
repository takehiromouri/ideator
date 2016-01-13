class ChangeIdeaToDescription < ActiveRecord::Migration
  def change
  	remove_column :ideas, :ideas
  	add_column :ideas, :description, :string
  end
end
