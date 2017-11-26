class Question < ActiveRecord::Base
  belongs_to :formulaire
  self.inheritance_column = nil
  enum typequestion: [:reponse_courte, :choix_multiple, :choix_simple]
end
