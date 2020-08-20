class DosesController < ApplicationController
    def index
        @doses = Dose.all
      end
  
      def show
        @dose = Dose.find(params[:id])
      end
  
      def new
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.new
      end

      def create
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.new(set_dose)
        @dose.cocktail = @cocktail
        if @dose.save
          redirect_to cocktail_path(@cocktail)
        else
          render :new
        end
      end
  
      def doses_params
        params.require(:dose).permit(:title, :details, :completed)
      end
      
      def destroy
        @dose = Dose.find(params[:id])
        @dose.destroy
    
        redirect_to cocktail_path
      end

      private

      def set_dose
        params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
      end


end
