class CreateOperativePlans < ActiveRecord::Migration
  def change
    create_table :operative_plans do |t|
      t.string :title
      t.text :description

      t.integer :position
      t.timestamps null: false
    end
  end
end
