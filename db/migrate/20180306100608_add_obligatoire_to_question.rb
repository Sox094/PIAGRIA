class AddObligatoireToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :obligatoire, :boolean
  end
end
