class Question < ActiveRecord::Base
  belongs_to :formulaire
  self.inheritance_column = nil
  enum typequestion: [:reponse_courte, :choix_multiple, :choix_simple]
  
  has_many :choixes, dependent: :destroy
  
  accepts_nested_attributes_for :choixes, allow_destroy: true

end
