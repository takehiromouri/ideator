class DeleteColumnlsgj < ActiveRecord::Migration
  def change
    remove_column :ideas, :name
  end
end
