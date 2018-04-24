class CreateResponsablesTasks < ActiveRecord::Migration
  def change
    create_table :responsables_tasks, id: false do |t|
      t.references :task, index: true
      t.references :responsable, index: true
    end
    add_foreign_key :responsables_tasks, :tasks
    add_foreign_key :responsables_tasks, :responsables
  end
end
