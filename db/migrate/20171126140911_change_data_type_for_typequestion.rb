class ChangeDataTypeForTypequestion < ActiveRecord::Migration
  def self.up
     change_table :questions do |t|
      t.change :typequestion, :integer
    end
  end
  def self.down
    change_table :questions do |t|
      t.change :typequestion, :integer
    end
  end
end
