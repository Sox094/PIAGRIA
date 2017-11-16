class Form < ActiveRecord::Base
  belongs_to :user
  
  validates :nom, presence: true
  validates :description, presence: true
  validates :datedecreation, presence: true


end
