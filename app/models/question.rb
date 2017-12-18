class Question < ActiveRecord::Base
  belongs_to :formulaire
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true
  
  #self.inheritance_column = nil
  enum typequestion: [:reponse_courte, :choix_multiple, :choix_simple]
  

  

end