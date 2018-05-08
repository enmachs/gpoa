class AddColumnArray < ActiveRecord::Migration
  def change
    add_column :objectives, :array_presupuesto, :text
  end
end
