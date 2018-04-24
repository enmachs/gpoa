class CreateOperativePlans < ActiveRecord::Migration
  def change
    create_table :operative_plans do |t|
      t.string :title
      t.text :description
      t.text :institution
      t.string :code

      t.integer :position
      t.timestamps null: false
    end
  end
end
