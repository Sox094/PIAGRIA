
class QuestionsController < ApplicationController
 
   before_action :set_question, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:show]
   #before_action :require_same_user, only: [:edit, :update]



def index
  @questions = Question.all
  #@question = current_user.questions.create(question_params)       
  #@questions = curren_user.formulaire.questions
end

def new
  #@formulaire = Formulaire.new
  #@question = @formulaire.questions.build
  @question = current_user.questions.new      
end
  
def create
      @question = current_user.questions.build(question_params)
      #@question = current_user.formulaire.build(question_params)# on crée une nvlle entrée dans la table Question en prenant en compte les variables precedents
        
    
      if @question.save    # Si le form est sauvegardée dans la BDDon notifie le user
        #redirect_to edit_formulaire_path(@formulaire), notice: "Votre q a bien été crée"
        redirect_to @question, notice: "Votre question a bien été crée"

      else     #Si la q n'est pas crée alors l'user est redirigée vers la page de création new

        render :new
      end
end


def show
    #@questions = @formulaire.questions
    #@questions = @formulaire.questions
end

def destroy
  @question.destroy
  respond_to do |format|
    format.html { redirect_to questions_url, notice: "La question a bien été détruite" }
    format.json { head :no_content }
  end
end
def update
    #respond_to do |format|
     # if @formulaire.update(formulaire_params)
      #  format.html { redirect_to @formulaire, notice: 'Formulaire was successfully updated.' }
       # format.json { render :show, status: :ok, location: @formulaire }
      #else
       # format.html { render :edit }
        #format.json { render json: @formulaire.errors, status: :unprocessable_entity }
      #end
    #end
    
    if @question.update(question_params)

      redirect_to @question, notice: "Modification enregistrée"
    else
      render :edit
    end
    
    def require_same_user 
      if current_user.id != @question.user_id
        flash[:danger] = "Vous n'avez pas les droits"
      end
    end
    
end  
  
private

  def set_question
      @question = Question.find(params[:id])
  end
    
     def question_params         
        params.require(:question).permit(:nom, :typequestion, :media)     
     end 
end