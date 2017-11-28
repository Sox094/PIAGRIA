class CreateChoixes < ActiveRecord::Migration
  def change
    create_table :choixes do |t|
      t.references :question, index: true, foreign_key: true
      t.string :choix

      t.timestamps null: false
    end
  end
end
