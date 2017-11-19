class Formulaire < ActiveRecord::Base

  belongs_to :user
  has_many :questions
  
  validates :name, presence: true
  validates :description, presence: true


end
