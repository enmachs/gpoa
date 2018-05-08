class CreateOperativePlans < ActiveRecord::Migration
  def change
    create_table :operative_plans do |t|
      t.string :responsible_actor
      t.text   :national_plan
      t.text   :state_plan
      t.string :district
      t.string :program
      t.string :subprogram
      t.string :project
      t.text   :objective


      # t.string :title
      # t.text :description
      # t.text :institution
      # t.string :code

      t.integer :position
      t.timestamps null: false
    end
  end
end
