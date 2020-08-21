class CocktailsController < ApplicationController
    def index
        @cocktails = Cocktail.all
    end
      
    def show
        @cocktail = Cocktail.find(params[:id])
    end
      
    def new
        @cocktail = Cocktail.new
    end
          
    def create
        @cocktail = Cocktail.new(cocktails_params)
        if @cocktail.save
            redirect_to cocktail_path(@cocktail)
        else
            render :new
        end
    end
      
    def edit
        @cocktail = Cocktail.find(params[:id])
    end
      
    def update
        @cocktail = Cocktail.find(params[:id])
        @cocktail.update(cocktails_params)
        
        redirect_to cocktail_path(@cocktail)
    end
      
    def cocktails_params
        params.require(:cocktail).permit(:name, :address, :category, :photo)
    end
          
    def destroy
        @cocktail = Cocktail.find(params[:id])
        @cocktail.destroy
        
        redirect_to cocktails_path
    end

    
end
