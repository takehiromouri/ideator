class ChangeDataTypes < ActiveRecord::Migration
  def change
  	change_column :ideas, :description, :text
  	change_column :ideas, :author, :string
  end
end
