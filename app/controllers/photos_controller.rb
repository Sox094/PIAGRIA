class PhotosController < ApplicationController
    
    def destroy
        @photo = Photo.find(params[:id])
        question = @photo.question
        
        @photo.destroy
        @photos = Photo.where(question_id: question.id)
        
        respond_to :js
    end
    
end
