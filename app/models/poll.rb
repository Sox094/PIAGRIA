class Poll < ActiveRecord::Base
  belongs_to :formulaire
  #belongs_to :question
  #belongs_to :answer
end
