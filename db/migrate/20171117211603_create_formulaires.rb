class CreateFormulaires < ActiveRecord::Migration
  def change
    create_table :formulaires do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
