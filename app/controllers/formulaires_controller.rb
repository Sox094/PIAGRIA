class FormulairesController < ApplicationController
  before_action :set_formulaire, only: [:edit, :update, :destroy]  
  before_action :authenticate_user!, except: [:show]
  # GET /formulaires
  # GET /formulaires.json
  def index
    #@formulaires = Formulaire.all
    @formulaires = current_user.formulaires
  end

  # GET /formulaires/1
  # GET /formulaires/1.json
  def show
  end

  # GET /formulaires/new
  def new
    #@formulaire = Formulaire.new
    @formulaire = current_user.formulaires.build
  end

  # GET /formulaires/1/edit
  def edit
  end

  # POST /formulaires
  # POST /formulaires.json
  def create
    #@formulaire = Formulaire.new(formulaire_params)
    @formulaire = current_user.formulaires.build(formulaire_params) # on crée une nvlle entrée dans la table Form en prenant en compte les variables precedents
        
    
      if @formulaire.save    # Si le form est sauvegardée dans la BDDon notifie le user
        #redirect_to edit_formulaire_path(@formulaire), notice: "Votre formulaire a bien été crée"
        redirect_to @formulaire, notice: "Votre formulaire a bien été crée"

      else     #Si le form n'est pas crée alors l'user est redirigée vers la page de création new

        render :new
      end
    
  end

  # PATCH/PUT /formulaires/1
  # PATCH/PUT /formulaires/1.json
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
    
    if @formulaire.update(formulaire_params)
      redirect_to @formulaire, notice: "Modification enregistrée"
    else
      render :edit
    end
  end

  # DELETE /formulaires/1
  # DELETE /formulaires/1.json
  def destroy
    @formulaire.destroy
    respond_to do |format|
      format.html { redirect_to formulaires_url, notice: 'Formulaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulaire
      @formulaire = Formulaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulaire_params
      params.require(:formulaire).permit(:name, :description)
    end
end