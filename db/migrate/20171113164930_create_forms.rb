class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :nom
      t.string :description
      t.date :datedecreation
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
