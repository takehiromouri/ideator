class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :ideas
      t.text :author
      t.timestamps null: false
    end
  end
end
