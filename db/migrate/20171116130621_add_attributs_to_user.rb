class AddAttributsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :entreprise, :string
    add_column :users, :fonction, :string
  end
end
