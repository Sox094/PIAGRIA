class CreateChartTests < ActiveRecord::Migration
  def change
    create_table :chart_tests do |t|
      t.integer :formulaire_id
      t.integer :question_id
      t.integer :answer_id
      t.string :nom

      t.timestamps null: false
    end
  end
end
