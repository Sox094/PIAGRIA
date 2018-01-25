class FormulairesController < ApplicationController
  before_action :set_formulaire, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update]

  # GET /formulaires
  # GET /formulaires.json
def index
    if current_user
      @formulaires = current_user.formulaires.paginate(:page => params[:page], :per_page => 10)
    else 
      @formulaires = Formulaire.all.paginate(:page => params[:page], :per_page => 10)
    end
end

def show
    @questions = @formulaire.questions
end

def new
  @formulaire = Formulaire.new
  #@question = @formulaire.questions.build
  #@answer = @question.answers.build

    if false
      @question.answers.build
      2.times do
      question = @formulaire.questions.build
      2.times { question.answers.build }
      end
    end
end
  
def edit
    @formulaire = Formulaire.find(params[:id])
    #@formulaire.questions.new  #Ici on crée les champs de création de Question
end

def create
    #puts formulaire_params.inspect
    #@formulaire = Formulaire.new(formulaire_params)
    @formulaire = current_user.formulaires.new(formulaire_params)
      if @formulaire.save    # Si le form est sauvegardée dans la BDDon notifie le user
        redirect_to @formulaire, notice: "Votre formulaire a bien été crée"   #Cette config est mieux que la suivante
      else     #Si le form n'est pas crée alors l'user est redirigée vers la page de création new
        render :new
      end
end

def update
  set_formulaire
    if @formulaire.update(formulaire_params)
      redirect_to @formulaire, notice: "Modification(s) enregistrée(s)"
    else
      render :edit
    end
end
def duplicate
 template = Formulaire.find(params[:id])
 @formulaire= template.dup
 @formulaire.save

 #for question in @formulaire.questions
 #  question.dup
 #  question.save
 #end

 #template2 = Question.where(formulaire_id: 47)
 #@question = template2.dup
 #@question.save
 redirect_to @formulaire, notice: "Formulaire dupliqué"
end
def destroy
    @formulaire.destroy
    respond_to do |format|
      format.html { redirect_to formulaires_url, notice: "Le formulaire a bien été supprimé" }
      format.json { head :no_content }
    end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulaire
      @formulaire = Formulaire.find(params[:id])
      @question = @formulaire.questions

    end
    
   
    def formulaire_params
          params.require(:formulaire).permit(:name, :description, 
                  questions_attributes: [:id, :nom, :typequestion, :image, '_destroy', 
                      answers_attributes:[:id, :content,'_destroy']]) if params[:formulaire]
          
          #puts YAML::dump params
    end
    
    def require_same_user 
      if current_user.id != @formulaire.user_id
        flash[:danger] = "Vous n'avez pas les droits"
      end
    end
    
    def your polls
    end
    
end