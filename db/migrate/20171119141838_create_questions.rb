class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :formulaire, index: true, foreign_key: true
      t.string :nom
      t.integer :typequestion
      t.string :media

      t.timestamps null: false
    end
  end
end
