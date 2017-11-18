class AddFieldsToFormulaire < ActiveRecord::Migration
  def change
    add_reference :formulaires, :user, index: true, foreign_key: true
  end
end
