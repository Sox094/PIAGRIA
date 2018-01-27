class PollsController < ApplicationController

    def new
        @poll = @formulaire.poll.new

    end
    def index
        @formulaire = Formulaire.find(params[:formulaire_id])
        @polls = @formulaire.polls.order("created_at DESC")
        @polls = Poll.where(formulaire_id: @formulaire)
        
        @polls2 = @polls.group("nom") 
        
        @answers = Answer.where(formulaire_id: @formulaire_id)
        @selecto = 3
        #@answers = Answer.where(Answer.id = @polls.answer_id)

    

    end
    
    def show
    end
    
    def new
    @formulaire = Formulaire.find(params[:formulaire_id])
    @poll = Poll.new
    @question = @formulaire.questions
      
    end
    
    def destroy
    end

def create
    @formulaire = Formulaire.find(params[:formulaire_id])
    
    @formulaire.questions.each_with_index do |question, i|
                if !params[:"nom_#{i}"].blank?
                    puts "MY PARAM: #{params["nom_#{i}_#{j}"]}\n"
                    Poll.create formulaire_id: (params[:formulaire_id]), question_id: (Answer.find(params["nom_#{i}"]).question_id), answer_id: (params["nom_#{i}"]), nom: (Answer.find(params["nom_#{i}"]).content)
                    #On fait passer l'answer id dans la table poll et on récupère à partir de cet answer id le nom et la question_id
                end
    end
    
      @question = @formulaire.questions
      @poll = @formulaire.polls.new(poll_params)
      @polls = @formulaire.polls.order("created_at DESC")
        if @poll.save
           redirect_to formulaire_polls_path(@formulaire)
        end
        Poll.last.destroy  #.... On en crée un de trop :/
end
    
    
    def poll_params
      #params.require(:poll).permit(:formulaire_id, :question_id, :answer_id,:nom) if params[:poll].present? 
    end

end