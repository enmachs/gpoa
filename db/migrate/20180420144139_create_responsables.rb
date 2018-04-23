class CreateResponsables < ActiveRecord::Migration
  def change
    create_table :responsables do |t|
      t.string :name
      t.string :email
      t.integer :age

      t.integer :position
      t.timestamps null: false
    end
  end
end
