class Formulaire < ActiveRecord::Base

  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :polls
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:nom].blank? }, :allow_destroy => true
  
  
  validates :name, presence: true
  validates :description, presence: true

  

end