
class QuestionsController < ApplicationController
 
   before_action :set_question, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:show]
   #before_action :require_same_user, only: [:edit, :update]

def show 
  @answers = @question.answers
  @photos = @question.photos
end


def index
  @questions = Question.all
  #@question = current_user.questions.create(question_params)       
  #@questions = curren_user.formulaire.questions
end

def new
  #@formulaire = Formulaire.new
  #@question = @formulaire.questions.build
  @question = current_user.questions.new       
     #@question.choixes.new

end
 def edit 
    @question = Question.find params[:id]
    @question.answers.new
    @photos = @question.photos

 end
 
def create
      @question = current_user.questions.new(question_params) # on crée une nvlle entrée dans la table Question en prenant en compte les variables precedents

      if @question.save    # Si le form est sauvegardée dans la BDDon notifie le user
        #redirect_to edit_formulaire_path(@formulaire), notice: "Votre q a bien été crée"
        if params[:images]
            params[:images].each do |i|
              @question.photos.create(image: i)
          end
        end
        @photos = @question.photos
        redirect_to edit_question_path(@question), notice: "Votre question a bien été créee"

      else     #Si la q n'est pas crée alors l'user est redirigée vers la page de création new

        render :new
      end
end


def show
    #@questions = @formulaire.questions
    #@questions = @formulaire.questions
    @choixes = @question.choixes

end

def destroy
    @question = Question.find params[:id]
    @question.destroy
  respond_to do |format|
    format.html { redirect_to questions_url, notice: "La question a bien été détruite" }
    format.json { head :no_content }
  end
  redirect_back fallback_location: root_path
end

def update
    set_question
        #@question = Question.find params[:id]

    if @question.update(question_params)
        #redirect_to edit_formulaire_path(@formulaire), notice: "Votre q a bien été crée"
        if params[:images]
            params[:images].each do |i|
              @question.photos.create(image: i)
          end
        end
        @photos = @question.photos
      redirect_to edit_question_path(@question), notice: "Modification enregistrée"
    else
      render :edit
    end
    
    def require_same_user 
      if current_user.id != @question.user_id
        flash[:danger] = "Vous n'avez pas les droits"
      end
    end
    
end 






    def set_question
      @question = Question.find(params[:id])
    end
    
    def question_params         
    params.require(:question).permit(:nom, :typequestion, :media, choixes_attributes: [:id, :choix]) 
    end
end