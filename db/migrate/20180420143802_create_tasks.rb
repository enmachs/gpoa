class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :objective, index: true

      t.integer :position
      t.timestamps null: false
    end
    add_foreign_key :tasks, :objectives
  end
end
