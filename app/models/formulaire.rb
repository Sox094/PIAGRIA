class Formulaire < ActiveRecord::Base

  belongs_to :user
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
  
  
  validates :name, presence: true
  validates :description, presence: true


end
