class FormsController < ApplicationController
    
    
    before_action :set_room, only: [:show, :edit, :update]
    
    
    #Pour créer un form il faut être identifié : Mais pas besoin d'etre authentifié pour voir les forms
    before_action :authenticate_user!, except: [:show]
        
    def index
        #Une variable 
        #On récup tout les forms crées par le current user
        # Chaque user verra sur cette page ses propres forms qu'il a crée
        @forms = current_user.forms
    end
    
    
    def new
       @form = current_user.forms.build #Nouvelle entrée dans la table form créer par le current user 
    end
    
    def create
        @form = current_user.form.build(form_params) # on crée une nvlle entrée dans la table Form en prenant en compte les variables precedents
        
        if @form.save    # Si le form est sauvegardée dans la BDDon notifie le user
            redirect_to @form, notice: "Votre formulaire a bien été crée"
        else     #Si le form n'est pas crée alors l'user est redirigée vers la page de création new

                render :new
        end
    end
    
    
    def show
    end
    
    def edit
    end
    
    def update
        if @form.update    
            redirect_to @form, notice: "Votre formulaire a bien été modifié"
        else

                render :edit
        end
    end
    
    
    private
    #Form.find(params[:id]) signifie qu'on trouve dans la table Form l'annonce correspondant à l'id de l'url (lien forms/xx où xx est l'id du form)
  #La variable @room sera donc liée directement à l'url de la page
    def set_form
        @form = Form.find(params[:id])
    end
    
    def form_params
        params.requre(:form).permit(:nom, :description, :datedecreation)
    end
    
      
      
      
end
