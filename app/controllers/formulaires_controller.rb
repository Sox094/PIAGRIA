class FormulairesController < ApplicationController
  before_action :set_formulaire, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update]

  # GET /formulaires
  # GET /formulaires.json
def index
    if current_user
      @formulaires = current_user.formulaires.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
      

    else 
      @formulaires = Formulaire.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
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

def  duplicate
  
  #===================================================== Duplique le formulaire (id nom, description) ==============================================
 formulaire = Formulaire.find(params[:id])
 #create new object with attributes of existing record 
 @formulaire2 = formulaire.dup
 @formulaire2.save
#===================================================================================================================================================
#================================================================== Duplique les questions =========================================================
 a= Question.find_by_sql(["Select * from questions where formulaire_id=?", formulaire.id]).as_json
 a_size = Question.find_by_sql(["Select * from questions where formulaire_id=?", formulaire.id]).size
     liste_question= []                                         #Liste des id des questions a récupérer pour écrire les réponses
b = []
(0..a_size-1).each do |i|

  Question.create formulaire_id: (@formulaire2.id), #On recupère le  formulaire_id contenant toutes les questions
                  nom: (a[i]["nom"]), 
                  typequestion: (a[i]["typequestion"]), 
                  media: (a[i]["media"]), 
                  user_id: (a[i]["user_id"]),
                  image_file_name: (a[i]["image_file_name"]),
                  image_content_type:(a[i]["image_content_type"]),
                  image_file_size: (a[0]["image_file_size"])
                  
#=================================================================================================================================================
                  
  liste_question.push(Question.find_by_sql(["Select * from questions where formulaire_id=?", formulaire.id]).as_json[i]["id"])
  #On veut récupérer la liste des questions id de base pour récupérer nos infos
  #Question.find_by_sql(["Select * from questions where formulaire_id=?", @formulaire2.id])[i].id)

#================================================================ Duplique les réponses ==========================================================

    b = Answer.find_by_sql(["Select * From answers where question_id=?", liste_question[i]]).as_json
    b_size = Answer.find_by_sql(["Select * From answers where question_id=?",liste_question[i]]).size

    (0..b_size-1).each do |j|              #On met ensuite nos nouveaux infos dans les bons questions id
        Answer.create formulaire_id: (@formulaire2.id),
                      question_id: (Question.find_by_sql(["Select * from questions where formulaire_id=?", @formulaire2.id]).as_json[i]["id"]),
                      content: (Answer.find_by_sql(["Select * From answers where question_id=?",liste_question[i]])[j]["content"])
    end
end
#===============================================================================================================================================
  #render :text => b.inspect   #Récupère les bons questions id à duppliquer
  if @formulaire2.save
    #render :text => liste_question[0].inspect   #Récupère les bons questions id à duppliquer
    redirect_to @formulaire2 ,notice: "Formulaire dupliqué"
  else
    render :new # This can be a render or redirect or whatever should happen if it fails
  end
  
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