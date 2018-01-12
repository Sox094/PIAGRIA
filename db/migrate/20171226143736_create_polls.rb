class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :formulaire, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.string :nom

      t.timestamps null: false
    end
  end
end
