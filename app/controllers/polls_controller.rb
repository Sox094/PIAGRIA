class PollsController < ApplicationController

    def index
        @formulaire = Formulaire.find(params[:formulaire_id])
        @polls = @formulaire.polls.order("created_at DESC")
        
    end
    
    def show
    end
    
    def new
    @formulaire = Formulaire.find(params[:formulaire_id])
    @poll = Poll.new
    @question = @formulaire.questions
      
    end
    
    def create
        @formulaire = Formulaire.find(params[:formulaire_id])
      @question = @formulaire.questions

        @poll = @formulaire.polls.new(poll_params)

        @polls = @formulaire.polls.order("created_at DESC")
        if @poll.save
           redirect_to formulaire_polls_path(@formulaire)
        end
    end
    
   def poll_params
      params.require(:poll).permit(:formulaire_id, :question_id, :answer_id,:nom) 
   end

end