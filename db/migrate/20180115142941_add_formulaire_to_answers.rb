class AddFormulaireToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :formulaire, index: true, foreign_key: true
  end
end
