class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :description
      t.references :operative_plan, index: true
      t.float :budget
      t.integer :position
      t.timestamps null: false
    end
    add_foreign_key :objectives, :operative_plans
  end
end
