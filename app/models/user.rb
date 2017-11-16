class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :forms
  
  
  validates :nom, presence: true, length: {maximum: 65}
  validates :prenom, presence: true, length: {maximum: 65}
  validates :entreprise, presence: true, length: {maximum: 65}
  validates :fonction, presence: true, length: {maximum: 65}
  
end
