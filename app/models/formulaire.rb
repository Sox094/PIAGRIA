class Formulaire < ActiveRecord::Base

  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :polls
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:nom].blank? }, :allow_destroy => true
  
  
  validates :name, presence: true
  validates :description, presence: true

    HUMANIZED_ATTRIBUTES = {
    :name => "Le nom du formulaire",
    :description => "La description du formulaire"
  }
    def self.human_attribute_name(attr, options = {})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end

end