class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.references  :operative_plan, index: true
      t.string      :title
      t.string      :municipio
      t.float       :budget
      t.string      :budget_clasificador
      t.string      :cantidad
      t.string      :product
      t.string      :trimestre
      t.text        :description
      t.string
      t.integer     :position
      t.timestamps  null: false
    end
    add_foreign_key :objectives, :operative_plans
  end
end
