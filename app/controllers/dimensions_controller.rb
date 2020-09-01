class DimensionsController < ApplicationController
    def index
        @dimensions = Dimension.all
    end    

    def new 
        @dimension = Dimension.new
    end 

    def create 
       @dimension = Dimension.new(dimension_params)
       @dimension.user = current_user
       @dimension.save
    end
    

    def show 
        @dimension = Dimension.find(params[:id])
    end     

    def dimension_params
        params.require(:dimension).permit(:name, :description)
    end    
end
