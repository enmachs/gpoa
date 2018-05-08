class AddColumnArrayToFloat < ActiveRecord::Migration
  def change
    add_column :objectives, :presupuesto, :float
  end
end
