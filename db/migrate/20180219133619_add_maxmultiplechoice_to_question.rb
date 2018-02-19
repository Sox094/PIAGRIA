class AddMaxmultiplechoiceToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :maxmultiplechoice, :integer
  end
end
