class Poll < ActiveRecord::Base
  belongs_to :formulaire
  #belongs_to :question
  #belongs_to :answer
  
  def self.to_csv
  attributes = %w{ids formulaire_id question_id answer_id nom created_at updated_at}
  CSV.generate do |csv|
    csv << attributes
    all.each do |poll|
      csv << poll.attributes.values_at(*column_names)
      end
    end
  end
  
  
end
